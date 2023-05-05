//
//  SupportViewController.swift
//  SecureMarshmallow_V3
//
//  Created by 박준하 on 2023/04/29.
//

import UIKit
import SnapKit
import Then

class SupportViewController: BaseSV {
    //BaseSV를 상속받는 SupportViewController 클래스 선언
    private var supportItems: [[SupportItem]] = [] // 지원 항목을 저장할 2차원 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSettingsItems()// 설정 항목 구성하는 함수 호출
    }
    // 화면 속성 설정하는 함수
    override func attribute() {
        view.backgroundColor = .systemBackground // 시스템 기본 배경 색상으로 설정
        navigationController?.navigationBar.prefersLargeTitles = false
        // 라지 타이틀 비활성화
        navigationItem.title = "지원"// 네비게이션 바 타이틀 설정
    }
    // 테이블 뷰의 셀을 설정하는 함수
    override func configureItems() {
        tableView.register(SupportCell.self, forCellReuseIdentifier: SupportCell.reuseIdentifier)
    }
    // 지원 항목을 구성하는 함수
    private func configureSettingsItems() {
        let section1 = [SupportItem(type: .support)]
        // SupportItem 클래스의 인스턴스 생성
        
        supportItems = [section1] // 지원 항목 2차원 배열에 추가
    }
    
}
// 테이블 뷰의 델리게이트 및 데이터 소스 메서드 구현
extension SupportViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportItems[section].count // 섹션의 지원 항목 수 반환
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SupportCell.reuseIdentifier, for: indexPath) as! SupportCell
        // 재사용 가능한 SupportCell 클래스의 인스턴스 생성
        let item = supportItems[indexPath.section][indexPath.row]
        // 해당 항목 가져오기
        cell.configure(with: item)
        // 셀에 데이터 전달하여 UI 설정
        return cell
    }
}
// 테이블 뷰 셀 클릭 시 이벤트 처리하는 메서드 구현
extension SupportViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        // 슈퍼 클래스의 메서드 호출
        let item = supportItems[indexPath.section][indexPath.row]
        // 클릭한 셀의 항목 가져오기
        switch item.type { // 항목 종류에 따른 분기 처리
        case .support:
            print("지원") // "지원" 출력
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15 // 섹션의 footer 높이 설정
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return supportItems.count // 섹션 개수 반환
    }
}
