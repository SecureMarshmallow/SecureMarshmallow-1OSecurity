import UIKit
import SnapKit

class DevelopersViewController: BaseVC {
    // TableView 객체를 지연 생성하여 선언
    // Closure를 이용해 테이블 뷰의 속성을 설정
    lazy var DevelopersTableView = UITableView().then {
        $0.register(DevelopersTableViewCell.self, forCellReuseIdentifier: DevelopersTableViewCell.className)
        $0.delegate = self
        $0.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 네비게이션 바의 큰 타이틀을 사용하지 않음
        navigationController?.navigationBar.prefersLargeTitles = false
        // 뷰의 타이틀을 설정
        title = "개발자 소개"
        // 테이블 뷰의 구분선을 제거
        DevelopersTableView.separatorStyle = .none
    }

    override func configureUI() {
        // 뷰에 테이블 뷰를 추가
        view.addSubview(DevelopersTableView)
        // 테이블 뷰의 오토레이아웃 제약 조건을 설정
        DevelopersTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // 네비게이션 바의 왼쪽에 back 버튼을 추가
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}

extension DevelopersViewController: UITableViewDataSource, UITableViewDelegate {
    // 테이블 뷰의 셀 개수를 반환하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    // 테이블 뷰의 셀을 반환하는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블 뷰의 셀을 재사용
        let cell = tableView.dequeueReusableCell(withIdentifier: DevelopersTableViewCell.className, for: indexPath) as! DevelopersTableViewCell
        // 셀의 선택 스타일을 설정
        cell.selectionStyle = .none
        
        // 인덱스 패스에 따라 셀의 데이터를 설정
        switch indexPath.row {
        case 0:
            cell.userImage.image = UIImage(named: "Junha")
            cell.nameLabel.text = "Junha park"
            cell.explanationLabel.text = "IOS Developer & backend"
            return cell

        case 1:
            cell.userImage.image = UIImage(named: "One")!
            cell.nameLabel.text = "Wonjun Do"
            cell.explanationLabel.text = "Backend security & Backend"
            return cell
            
        case 2:
            cell.userImage.image = UIImage(named: "Yang")
            cell.nameLabel.text = "Jieun Yang"
            cell.explanationLabel.text = "IOS security"
            return cell
            
        default:
            cell.nameLabel.text = "사용자가 없습니다"
            cell.explanationLabel.text = "아무것도 없습니다."
            return cell
        }
    }

    // 테이블 뷰의 셀 높이를 반환하는 함수
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
