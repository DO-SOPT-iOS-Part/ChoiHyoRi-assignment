import UIKit

class WeatherViewController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // 새로운 뷰 컨트롤러의 내용을 구성할 수 있습니다.
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "새로운 페이지"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        // 제약 조건 설정
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
