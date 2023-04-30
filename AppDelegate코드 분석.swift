import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //프로젝트를 생성하면 자동적으로 만들어지는 AppDelegate 클래스 선언
    //UIResponder는 이벤트가 발생하면 처리해서 내용을 구현하는 일을 주로 함.
    //UIApplicationDelegate는 앱의 공유된 동작을 관리하는데 사용하는 일련의 방법.

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        //iOS 앱이 새로운 scene session을 연결할 때 호출되는 메서드
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        //UISceneConfiguration 객체는 해당 세션에 대한 구성 정보를 담고 있음
            //여기에서는 "Default Configuration"이라는 이름의 세션 구성을 반환
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        //사용자가 애플리케이션에서 버린 (제거한) 모든 scene session들에 대한 처리를 담당하는 함수
        //사용자가 애플리케이션 내에서 어떤 scene도 제거하지 않았다면 이 함수는 호출되지 않음
        //이 함수를 사용하여 버려진 scene session과 관련된 자원을 해제
      
      //이 함수를 호출하도록 우회하는 것도 방법이 될 수 있겠다
      
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
    //NSPersistentContainer 인스턴스 생성
        //NSPersistentContainer 인스턴스는 App에서 Core Data Stack을 캡슐화하는 컨테이너
        let container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            //loadPersistentStores 메서드를 호출하여 데이터베이스를 로드
            if let error = error as NSError? {
                //에러처리 하는 코드
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
        // 컨테이너 반환
    }()
    //Core Data 스택을 초기화하는 함수

    func saveContext() {
        let context = persistentContainer.viewContext
        //persistentContainer는 앱에서 사용되는 Core Data stack의 일부
        //viewContext는 persistentContainer의 메인 NSManagedObjectContext를 반환
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            //Core Data를 사용할 때 데이터를 저장하는 메서드
        }
    }
    //Core Data 스택에서 변경된 내용을 저장하는 함수

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    //이 함수는 delegate에게 실행 프로세스가 거의 끝나고 앱이 실행될 준비가 거의 되었음을 알리는 함수

}


