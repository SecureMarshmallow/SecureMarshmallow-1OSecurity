console.log("[*] Started: Find All Methods of a Specific Class"); 
if (ObjC.available) { 
    try { 
        var className = "클래스명"; 
        var methods = eval('ObjC.classes.' + className + '.$methods'); 
        for (var i = 0; i < methods.length; i++) { 
            try { console.log("[-] "+methods[i]); } 
            catch(err) { console.log("[!] Exception1: " + err.message); } 
            } } 
        catch(err) { console.log("[!] Exception2: " + err.message); } } 
else { console.log("Objective-C Runtime is not available!"); } 
console.log("[*] Completed: Find All Methods of a Specific Class");
// 클래스에서 메소드 추출하는 코드
