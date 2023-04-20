// bypass_ptrace.js
function PatchSVC() {
	var hook = ObjC.classes.YDDebuggerChecks["+ setPtraceWithASM"];
  //YDDebuggerChecks 클래스의 + setPtraceWithASM 함수 주소를 알아냄
	// console.log(hook.implementation);
	Memory.scanSync(ptr(hook.implementation), 4096, '01 00 00 d4').forEach(function (match) {
    //해당 주소로부터 4096만큼의 주소까지 SVC 명령어의 바이트 코드인 “01 00 00 d4”를 검색
        Memory.protect(ptr(match.address), 4096, 'rwx'); 
    //해당 바이트가 범위 내에 존재하면 match.address에 해당 바이트가 존재하는 주소가 반환
    //Memory.protect API를 통해 해당 주소의 메모리 권한을 "rwx"로 변경
        Memory.writeByteArray(match.address, [0xe0, 0x03, 0x00, 0x2a]); // mov W0, W0
    //쓰기 권한을 추가한 이후, SVC 명령어를 아무런 역할을 하지 않는 코드인 mov w0, w0로 패치
    });
}
function modifyPtraceArg() {
    var ptrace_ptr = Module.findExportByName(null, "ptrace");
  //ptrace 함수를 후킹
    Interceptor.attach(ptrace_ptr, {
    	onEnter(args) {
    		console.log("Before Arg: " + args[0]);
    		args[0] = ptr(0x0);
    		console.log("After Arg: " + args[0]);
        //해당 함수가 호출되면 첫 번째 인자인 PT_DENY_ATTACH를 0으로 변경
    	}
    });
}
PatchSVC();
modifyPtraceArg();
