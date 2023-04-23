// bypass_checkfiles.js
function replaceCheckSuspiciousFiles() {
    
	var hook = ObjC.classes.YDJailbreakCheck["- checkSuspiciousFiles"];
    //YDJailbreakCheck 클래스의 - checkSuspiciousFiles 함수의 주소를 알아내고, 후킹
	Interceptor.replace(hook.implementation, new NativeCallback(function () {
	    //해당 함수가 호출되면 원본 함수의 코드를 실행하지 않고
        return 0;
        //곧바로 return 0을 실행
	}, 'int', []));
}
function checkModule() {
	var hook = ObjC.classes.NSURL["- checkResourceIsReachableAndReturnError:"];
    //NSURL 클래스의 - checkResourceISReachableAndReturnError: 함수의 주소를 알아내고, 후킹 
	Interceptor.attach(hook.implementation, {
        onLeave(retval) {
        	retval.replace(0);
            //해당 함수가 종료될 때 반환값을 0으로 변경
        }
    });
}
replaceCheckSuspiciousFiles();
// checkModule();


//아쉬운점: 이 코드는 checkra1n 앱을 통해서 탈옥한 경우에만 해당된다. 나는 palera1n을 통해 탈옥을 했기 때문에 이 코드가 적용되지 않았다.
