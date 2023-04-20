// bypass_debuggerSysctl.js
function modifyGetpidRet() {
	var hook = ObjC.classes.YDDebuggerChecks["+ debugger_sysctl"];
  // YDDebuggerChecks 클래스의 + debugger_sysctl 함수의 주소를 알아내고, 후킹 
    var getpid = Module.findExportByName(null, "getpid");
  //getpid 함수가 호출되면 
    var call = 0
    Interceptor.attach(hook.implementation, {
    	onEnter(args) {
	    		Interceptor.attach(getpid, {
					onLeave(retval) {
						retval.replace(0);
            //함수의 반환값 0으로 변경
					}
				});
	    	}
	});
}
function sysctlProc() {
    var sysctl = Module.findExportByName(null, "sysctl");
  //sysctl 함수의 주소를 알아내고, 후킹
    var call = 0
	Interceptor.attach(sysctl, {
		onEnter(args) {
			this.info = ptr(args[2]);
      //해당 함수가 호출될 때 전달되는 세 번째 포인터 저장
		},
		onLeave(args) {
			console.log("Before info.kp_proc.p_flag: " + this.info.add(32).readU16().toString(16));
			Memory.writeByteArray(this.info.add(32), [0x00, 0x00]) // 0x800 to 0x0000
			console.log("After info.kp_proc.p_flag: " + this.info.add(32).readU16().toString(16));
      //함수가 종료될 때 저장한 구조체의 kp_proc.p_flag 값을 0x0000으로 변경
		}
	});
}
function debuggerSysctlRet() {
	var hook = ObjC.classes.YDDebuggerChecks["+ debugger_sysctl"];
  //debuggerSysctlRet 함수의 주소를 알아내고, 후킹 
	Interceptor.attach(hook.implementation, {
		onLeave(retval) {
			retval.replace(0);
      //해당 함수가 종료될 때 반환값을 0으로 변경
		},
    });
}
modifyGetpidRet();
sysctlProc();
debuggerSysctlRet();
