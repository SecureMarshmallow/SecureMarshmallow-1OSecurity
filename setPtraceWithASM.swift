+ (BOOL) setPtraceWithASM {
  //어셈블리로 ptrace 시스템 콜을 호출해 디버깅 여부 탐지
    [self warning];
    NSString *message;
    BOOL flag = true;
    #if defined(__arm64__)
        message = @"ptrace for __arm64__";
        __asm(
            "mov x0, #26\n"             // ptrace  // 레지스터 X0에 ptrace 시스템 콜 번호인 26을 삽입
            "mov x1, #31\n"             // PT_DENY_ATTACH
            "mov x2, #0\n"
            "mov x3, #0\n"             // X1~X3 레지스터에 시스템 콜 인자 삽입
            "mov x16, #0\n"
            "svc #128\n"                //SVC #128 명령어를 실행해 시스템 콜 호출
        );
    #else
        message = @"Unknown target.";
    #endif
    flag = false;       // if a debugger was attached, it would have crashed
    NSLog(@"%@", message);
    return flag;
}
