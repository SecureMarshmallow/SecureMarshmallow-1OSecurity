import UIKit

class TimeOfAppViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView() // 테이블 뷰 생성
    var times: [String] = [] // 앱을 열었던 시간을 저장할 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 설정
        navigationController?.navigationBar.prefersLargeTitles = false
        // 라지 타이틀 비활성화
        title = "앱 열기 추적" // 뷰 컨트롤러 타이틀 설정
        
        // 테이블 뷰 설정
        tableView.delegate = self // 델리게이트 설정
        tableView.dataSource = self // 데이터 소스 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 셀 등록
        view.addSubview(tableView) // 뷰에 테이블 뷰 추가
        tableView.frame = view.bounds // 테이블 뷰의 프레임을 뷰의 bounds로 설정
        
        // UserDefaults에서 시간 배열 불러오기
        if let savedTimes = UserDefaults.standard.stringArray(forKey: "times") {
            times = savedTimes
        }
        
        // 현재 시간을 시간 배열에 추가하고 UserDefaults에 저장
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentTime = formatter.string(from: Date())
        times.insert(currentTime, at: 0)
        UserDefaults.standard.set(times, forKey: "times")
        tableView.reloadData() // 테이블 뷰 리로드
    }
    
    // MARK: - Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count // 배열의 원소 개수만큼 셀 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 셀 생성
        cell.textLabel?.text = times[indexPath.row] // 셀의 텍스트 설정
        return cell // 셀 반환
    }
    
}
//앱이 언제 열렸는지를 추적하는 기능을 하는 뷰 컨트롤러
