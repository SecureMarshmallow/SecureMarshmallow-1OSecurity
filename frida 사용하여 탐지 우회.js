// bypass_exception_ports.js
function modifyExceptionCnt() {
	var task = Module.findExportByName(null, "task_get_exception_ports");
	Interceptor.attach(task, {
		onEnter(args) {
			this.count = args[3];
		},
		onLeave(retval) {
			console.log(Memory.readByteArray(this.count, 4));
			Memory.writeByteArray(this.count, [0,0,0,0]);
			console.log(Memory.readByteArray(this.count, 4));
		}
	})
}
function modifyDebugExceptionRet() {
	var hook = ObjC.classes.YDDebuggerChecks["+ debugger_exception_ports"];
    Interceptor.attach(hook.implementation, {
    	onLeave(retval) {
    		retval.replace(0);
    	}
    });
}
modifyExceptionCnt();
modifyDebugExceptionRet();

//modifyExceptionCnt 함수를 사용하여 task_get_exception_ports 함수의 주소를 알아내고 후킹하고, 
//exception_count 변수의 주소를 저장하고, 함수가 종료될 때 해당 변수에 저장된 값을 0으로 변경하였습니다. 
//modifyDebugExceptionRet함수를 사용하여 debugger_exception_ports함수의 주소를 알아내고 후킹하였습니다.
//해당 함수가 종료될 때, 반환값을 0으로 반환합니다
