// bypass_sslpin.js
function modifySecResult() {
	var SecTrust = Module.findExportByName(null, "SecTrustEvaluate");
    //SecTrustEvaluate 함수의 주소를 알아내고 후킹합니다
	Interceptor.attach(SecTrust, {
		onEnter(args) {
			this.result = args[1];
		},
        //해당 함수가 호출될 때 secResult 변수의 주소를 저장하고
		onLeave(retval) {
			console.log(Memory.readByteArray(this.result, 4));
			Memory.writeByteArray(this.result, [1,0,0,0]);
            //함수가 종료될 때 저장한 secResult 값을 1로 변경합니다.
			console.log(Memory.readByteArray(this.result, 4));
		}
	})
}
modifySecResult();
