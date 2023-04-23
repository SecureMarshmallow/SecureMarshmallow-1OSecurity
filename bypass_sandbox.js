// bypass_sandbox.js
function forkRet() {
    var hook = ObjC.classes.YDJailbreakCheck['- checkSandboxFork']
    //YDJailbreakCheck 클래스의 - checkSandboxFork 함수의 주소를 알아내고, 후킹
    var fork = Module.findExportByName(null, "fork");
	Interceptor.attach(hook.implementation, {
		onEnter(args) {
			Interceptor.attach(fork, {
				onLeave(retval) {
					retval.replace(-1);
          //이후 해당 함수에서 fork가 호출되면 함수의 반환값을 -1로 변경합니다.
					console.log("Ret: " + retval.toInt32());
				}
			});
		}
	});
}
function writeToFileArgs() {
	var hook = ObjC.classes.NSString['- writeToFile:atomically:encoding:error:']
  //NSString 클래스의 - writeToFile:atomically:encoding:error: 함수의 주소를 알아내고, 후킹
  
  
	Interceptor.attach(hook.implementation, {
		onEnter(args) {
			var obj = ObjC.Object(args[2]);
			console.log("Path: " + obj.toString());
			args[2] = ObjC.classes.NSString.stringWithString_("/nothing/nothing.txt");
      //해당 함수가 호출되면 함수의 실제 인자인 세 번째 인자(args[2])의 값을 “/nothing/nothing.txt”로 변경
      //이때 문자열은 NSString 타입이여야하므로, 해당 클래스의 stringWithString_ 함수를 사용해 문자열을 할당
			var obj = ObjC.Object(args[2]);
			console.log("Modified path: " + obj.toString());
		},
    });
}
forkRet();
writeToFileArgs();
