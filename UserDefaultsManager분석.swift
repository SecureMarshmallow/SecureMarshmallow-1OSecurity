import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [SavePassword]
    func setReview(_ newValue: SavePassword)
    //각각 저장된 리뷰를 가져오고, 새 리뷰를 저장하는 데 사용
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    //구조체 정의
    enum Key: String {
        case review
    }
    
    func getReviews() -> [SavePassword] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        //UserDefaults에서 "review" 키로 데이터를 가져와서 SavePassword 배열로 디코딩하고 반환. 만약 데이터가 없다면 빈 배열을 반환
        return (try? PropertyListDecoder().decode([SavePassword].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: SavePassword) {
        var currentReviews: [SavePassword] = getReviews()
        currentReviews.insert(newValue, at: 0)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews),
                                       forKey: Key.review.rawValue)
    }
    //UserDefaults에서 이전 리뷰를 가져와서 새 리뷰를 추가한 다음 UserDefaults에 저장
}
//사용자 리뷰를 저장하고 검색하는 데 사용되는 데이터 관리 클래스를 정의
