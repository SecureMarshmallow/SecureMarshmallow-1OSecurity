import UIKit

// TapBarViewController 클래스 선언, UITabBarController를 상속받음
class TapBarViewController: UITabBarController {
    
    // HomeViewController 네비게이션 컨트롤러 설정
    private lazy var homeViewController: UINavigationController = {
        let viewController = SecureMarshmallow_V3.HomeViewController() // HomeViewController 객체 생성
        let tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house.fill"), tag: 0) // 탭 바 아이템 설정
        viewController.tabBarItem = tabBarItem // 뷰 컨트롤러에 탭 바 아이템 할당
        let navigationView = UINavigationController(rootViewController: viewController) // 네비게이션 컨트롤러 객체 생성
        return navigationView
    }()
    
    // LockViewController 설정
    private lazy var LockViewController: UIViewController = {
        let viewController = ListViewController() // ListViewController 객체 생성
        let tabBarItem = UITabBarItem(title: "lock", image: UIImage(systemName: "lock"), tag: 1) // 탭 바 아이템 설정
        viewController.tabBarItem = tabBarItem // 뷰 컨트롤러에 탭 바 아이템 할당
        let navigationView = UINavigationController(rootViewController: viewController) // 네비게이션 컨트롤러 객체 생성
        return navigationView
    }()
    
    // PhotoViewController 설정
    private lazy var PhotoViewController: UIViewController = {
        let viewController = UIViewController() // UIViewController 객체 생성
        let tabBarItem = UITabBarItem(title: "photo", image: UIImage(systemName: "photo.fill"), tag: 2) // 탭 바 아이템 설정
        viewController.tabBarItem = tabBarItem // 뷰 컨트롤러에 탭 바 아이템 할당
        let navigationView = UINavigationController(rootViewController: viewController) // 네비게이션 컨트롤러 객체 생성
        return navigationView
    }()
    
    // SettingsViewController 설정
    private lazy var SettingsViewController: UIViewController = {
        let viewController = SecureMarshmallow_V3.SettingsViewController() // SettingsViewController 객체 생성
        let tabBarItem = UITabBarItem(title: "setting", image: UIImage(systemName: "gear"), tag: 2) // 탭 바 아이템 설정
        viewController.tabBarItem = tabBarItem // 뷰 컨트롤러에 탭 바 아이템 할당
        let navigationView = UINavigationController(rootViewController: viewController) // 네비게이션 컨트롤러 객체 생성
        return navigationView
    }()
    
    // viewDidLoad() 메서드 재정의
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [homeViewController,
                           LockViewController,
                           PhotoViewController,
                           SettingsViewController] // 탭 바에 뷰 컨트롤러 추가
        configureTabBar() // 탭 바 UI 구성 설정
    }
    
    // viewWillLayoutSubviews() 메서드 재정의
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        var tabFrame = tabBar.frame // 탭 바 프레임 가져오기
        if UIScreen.main.bounds.height <= 667 {
            tabFrame.size.height = 50 // 아이폰 SE 이하 크기의 기기에서 탭 바 높이를 50으로 설정
        } else {
            tabFrame.size.height = 70
        }
        tabBar.frame = tabFrame
    }
}

extension UITabBarController {
    
    func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .white
        
        tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            //tabbar 불투명도
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        self.tabBar.layer.cornerRadius = 8
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        self.tabBar.tintColor = .black
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
    }
}
