+(BOOL)checkParent{
  //getppid 함수에서 반환된 값이 1인지 비교해 디버깅을 탐지
    NSProcessInfo *process = [NSProcessInfo processInfo];
    NSString *name = [process processName];
    pid_t pid = getpid();
    pid_t parentpid = getppid();
  //getppid 함수를 호출해 부모 프로세스의 PID를 parentpid 변수에 저장
    NSLog(@"[*]🐝Process Name: '%@'\tProcess ID:'%d'\tParent'%d'\t%@", name, pid, parentpid, [process hostName]);
    
    #if defined(__arm64__)
        return parentpid != 1 ? YES : NO;
  //parentpid가 launchd 프로세스의 PID인 1인지 아닌지를 비교하고, 1이 아닌 값이라면 YES를 반환
    #pragma mark: Broken. Unsure if it is possible to get parent processes name on __x86_64__
    #elif defined(__x86_64__)
        NSLog(@"[*]🐝: Work in progress -> the same getppid() does NOT work on iOS Simulator");
    #endif
    
    return NO;
}
