import UIKit

import RxSwift
import RxCocoa
import RxRelay
import RxFlow

import Then
import SnapKit

import Alamofire
import Kingfisher

class BaseVC: UIViewController {
    //UIViewController는 UIKit 앱의 뷰 계층 구조를 관리하는 객체
    let bound = UIScreen.main.bounds
    //UIScreen는 하드웨어 기반 디스플레이에 관련이 있는 속성을 정의하는 객체
    var disposeBag = DisposeBag()
    //DisposeBag는 Rx의 메모리 관리, RxSwift: 비동기&이벤트의 표현 => 관찰 가능한 순차적인 형태, 함수형태의 연산자
    override func viewDidLayoutSubviews() { self.layout() }
    //viewDidLayoutSubviews는 다른 뷰들의 컨텐츠 업데이트, 뷰들의 크기나 위치를 최종적으로 조정, 테이블의 데이터를 reload
    //layout은 화면에서 UIView의 크기와 위치 의미
    override func viewDidLoad() {
        //viewDidLoad는 viewController의 view가 메모리에 로드된 후 호출됨
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        //백그라운드 색 변경
        self.bind()
        //함수를 묶는 함수
        self.configureUI()
        //UI 꾸며주는 함수
        self.configureItem()
        
        self.view.setNeedsUpdateConstraints()
        //setNeedsUpdateConstraints는 Update Cycle에서 Constraint가 업데이트되는 것을 보장
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //뷰가 화면에 표시된 이후에 수행. 뷰를 보여줄 때 필요한 추가적인 작업을 담당
        super.viewDidAppear(animated)
        self.attribute()
        self.touchEvent()
    }
    
    func touchEvent() { }
    func configureItem() { }
    func bind() { }
    func layout() { }
    func attribute() { }
    func configureUI() { }
    func configureTableView() { }
}
