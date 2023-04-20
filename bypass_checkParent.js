function modifyGetppidRet() {
	var getppid_ptr = Module.findExportByName(null, "getppid");
  //getppid 함수를 후킹
	Interceptor.attach(getppid_ptr, {
		onLeave(retval) {
			retval.replace(1);
      //함수에서 반환하는 PID를 1로 변경
		}
	})
}
function modifycheckParentRet() {
	var hook = ObjC.classes.YDDebuggerChecks["+ checkParent"];
  //후킹
    Interceptor.attach(hook.implementation, {
    	onLeave(retval) {
    		retval.replace(0);
       // + checkParent 함수의 반환값을 0
    	}
    });
}
modifyGetppidRet();
modifycheckParentRet();
