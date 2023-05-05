import UIKit
import SnapKit
import Then

class DevelopersTableViewCell: UITableViewCell {
    
    // 사용자 이미지를 담을 UIImageView
    lazy var userImage = UIImageView().then {
        $0.backgroundColor = .black  // 이미지가 없을 경우를 대비해 배경색을 검정색으로 설정
        $0.layer.cornerRadius = 25.0 // 이미지를 원형으로 만들기 위해 라운드 처리
    }
    
    // 사용자 이름을 나타낼 UILabel
    lazy var nameLabel = UILabel().then {
        $0.textColor = .black // 글씨 색상을 검정색으로 설정
        $0.text = ""         // 초기 텍스트는 없음
        $0.font = .systemFont(ofSize: 15.0, weight: .thin) // 글꼴 설정
    }
    
    // 사용자 설명을 나타낼 UILabel
    lazy var explanationLabel = UILabel().then {
        $0.textColor = .gray  // 글씨 색상을 회색으로 설정
        $0.text = ""          // 초기 텍스트는 없음
        $0.font = .systemFont(ofSize: 13.0, weight: .thin) // 글꼴 설정
    }
    
    // 자세히 보기 버튼을 나타낼 UIButton
    lazy var detailButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal) // 버튼 이미지 설정
        $0.tintColor = UIColor.black  // 버튼 색상을 검정색으로 설정
        $0.isUserInteractionEnabled = false  // 버튼 동작을 비활성화
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        // 컨텐트 뷰에 서브뷰들을 추가
        contentView.addSubview(userImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(explanationLabel)
        contentView.addSubview(detailButton)
        
        // userImage의 제약조건 설정
        userImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24.0)  // 왼쪽에서 24.0만큼 간격 띄우기
            $0.centerY.equalToSuperview()                // 수직 중앙 정렬
            $0.trailing.lessThanOrEqualTo(detailButton).offset(-24)
            // 오른쪽에서 detailButton보다 24.0만큼 작게 설정
            $0.height.equalTo(45.0)                      // 높이는 45.0으로 고정
            $0.width.equalTo(35.0)                       // 너비는 35.0으로 고정
        }
        
        // nameLabel의 제약조건 설정
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.top).offset(5.0)     // userImage의 상단과 5.0만큼 간격 띄우기
            $0.leading.equalTo(userImage.snp.trailing).offset(10.0)  // userImage 오른쪽에서 10.0만큼 띄우기
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        detailButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}
