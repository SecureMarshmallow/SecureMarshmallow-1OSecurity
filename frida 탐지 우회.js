// bypass_checkModules.js
var objc_copyImageNames = Module.findExportByName(null, "objc_copyImageNames");
console.log("objc_copyImageNames: " + objc_copyImageNames);
Interceptor.attach(objc_copyImageNames, {
    onEnter(args) {
        this.counter=args[0];
    },
    onLeave(ret) {
        Memory.writeByteArray(ptr(this.counter), [0, 0, 0, 0]);
    }
});

// bypass_checkFridaInstalled.js
function modifyNSURLRet() {
	var hook = ObjC.classes.NSURL['- checkResourceIsReachableAndReturnError:']
	Interceptor.attach(hook.implementation, {
		onLeave(retval) {
			retval.replace(0); // NO
		}
	});
}
function accessRet() {
	var access = Module.findExportByName(null, "access");
	Interceptor.attach(access, {
		onLeave(retval) {
			retval.replace(-1);
		}
	});
}
function checkRet() {
	var className = "YDFridaDetection";
	var funcName = "+ checkIfFridaInstalled";
	var hook = eval('ObjC.classes.' + className + '["' + funcName + '"]');
	console.log(hook.implementation);
	Interceptor.attach(hook.implementation, {
        onLeave: function (retValue) {
        	retValue.replace(0);
        }
    });
}
// checkRet();
modifyNSURLRet();
accessRet();


// bypass_checkDefaultPort.js
function connectReplace() {
    var hook = ObjC.classes.YDFridaDetection['+ checkDefaultPort']
	Interceptor.attach(hook.implementation, {
		onEnter(args) {
			console.log("connect:");
			var connect = Module.findExportByName(null, "connect");
			Interceptor.replace(connect, new NativeCallback(function () {
			    return -1;
			}, 'int', []));
		}
	});
}
function checkRet() {
    var hook = ObjC.classes.YDFridaDetection['+ checkDefaultPort:']
	Interceptor.attach(hook.implementation, {
        onLeave(retval) {
        	retval.replace(0);
        }
    });
}
connectReplace();
// checkRet();

//js코드를 사용해 frida로 탐지를 우회해봤습니다.
