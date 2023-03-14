import UIKit

// SettingsItemType -> SettingsItem enum으로 받아오는 거에요
enum SettingsItemType {
//enum은 열거형 선언
    case gmailInformation // gmail 정보
    case idInformation // 아이디 정보
    case appPassword // 앱 비밀번호
    case intrusionInformation //침임 시도
    case appTracking //앱 열기 추적
    case changeAppIcon //앱 아이콘 변경
    case changeAppTheme // 앱 테마 변경
    case help // 지원
    case bugReport // 버그 제보
    case feedback // 피드백
    case appShare // 앱 공유
    case privacyPolicy // 개인정보처리 방침
    case termsofUse // 이용 약관
    case howToUse // 사용방법
    case developerIformation // 개발자 소계
    
    var title: String {
        switch self {
//대충 switch self는 열거형과 연동 이런느낌인듯
        case .gmailInformation:
            return "gmail 정보"
        case .idInformation:
            return "아이디 정보"
        case .appPassword:
            return "앱 비밀번호"
        case .intrusionInformation:
            return "침입 시도"
        case .appTracking:
            return "앱 열기 추적"
        case .changeAppIcon:
            return "앱 아이콘 변경"
        case .changeAppTheme:
            return "앱 테마 변경"
        case .help:
            return "지원"
        case .bugReport:
            return "버그 제보"
        case .feedback:
            return "피드백"
        case .appShare:
            return "앱 공유"
        case .privacyPolicy:
            return "개인정보 처리 방침"
        case .termsofUse:
            return "이용 약관"
        case .howToUse:
            return "사용 방법"
        case .developerIformation:
            return "개발자 정보"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .gmailInformation:
            return UIImage(systemName: "info.circle")
//UIImage 앱에서 이미지 데이터를 관리하는 객체
        case .idInformation:
            return UIImage(systemName: "person.circle")
        case .appPassword:
            return UIImage(systemName: "bell.circle")
        case .intrusionInformation:
            return UIImage(systemName: "questionmark.circle")
        case .appTracking:
            return UIImage(systemName: "arrow.left.square")
        case .changeAppIcon:
            return UIImage(systemName: "arrow.left.square")
        case .changeAppTheme:
            return UIImage(systemName: "info.circle")
        case .help:
            return UIImage(systemName: "info.circle")
        case .bugReport:
            return UIImage(systemName: "info.circle")
        case .feedback:
            return UIImage(systemName: "info.circle")
        case .appShare:
            return UIImage(systemName: "info.circle")
        case .privacyPolicy:
            return UIImage(systemName: "info.circle")
        case .termsofUse:
            return UIImage(systemName: "info.circle")
        case .howToUse:
            return UIImage(systemName: "info.circle")
        case .developerIformation:
            return UIImage(systemName: "info.circle")
        }
    }
}

struct SettingsItem {
    let type: SettingsItemType
    let hasSwitch: Bool
    let switchState: Bool
    
    init(type: SettingsItemType, hasSwitch: Bool = false, switchState: Bool = false) {
        self.type = type
//인스턴스 내부에 같은 이름으로 선언된 변수들을 좀 더 명확히 명시
        self.hasSwitch = hasSwitch
        self.switchState = switchState
    }
}
