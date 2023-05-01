import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    //화면에 무엇을 보여줄지 관리하는 역할
    var window: UIWindow?
    //윈도우 뷰들을 담는 컨테이너, 이벤트를 전달해주는 매개체


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //첫 content view, 새로운 UIWindow를 생성하고 window의 rootViewController를 설정
        //UIScene = 하드웨어 기반의 디스플레이와 관련된 프로퍼티들을 정의한 최상위 객체
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //조건문
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.windowScene = windowScene
                
        self.window?.rootViewController = BaseNC(rootViewController: TapBarViewController())
        self.window?.makeKeyAndVisible()
        //앱의 초기 뷰 계층을 설정하는 역할
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}


//이 코드에서는 딱히 우회할 수 있는 방법이 안보인다
