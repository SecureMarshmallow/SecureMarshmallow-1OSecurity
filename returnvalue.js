if (ObjC.available) { 

    try { var className = "UINavigationController"; 
    var funcName = "- _isRootViewController"; 
    var hook = eval('ObjC.classes.' + className + '["' + funcName + '"]');
    
    Interceptor.attach(hook.implementation, { 
        onLeave: function(retval) { console.log("[*] Class Name: " + className);
        console.log("[*] Method Name: " + funcName); 
        console.log("\t[-] Type of return value: " + typeof retval);
        console.log("\t[-] Return Value: " + retval); } }); } 
    catch(err) { console.log("[!] Exception2: " + err.message); } } 
    
    else { console.log("Objective-C Runtime is not available!"); }
    //선택한 클래스의 있는 메소드의 리턴값을 1 -> 0으로 변환시켜주는 코드
