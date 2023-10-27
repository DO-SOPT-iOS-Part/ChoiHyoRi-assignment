//
//  ViewController.swift
//  sopt33-second-seminar
//
//
//

import UIKit

class ViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    @objc func imageButtonTapped() {
        let newViewController = WeatherViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    let buttonWithImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backgroundS"), for: .normal)
        button.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside) // 변경된 부분
        return button
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        // Add navigation bar
        self.view.addSubview(navigationBar)
        
        // Add the scroll view
        self.view.addSubview(scrollView)
        scrollView.addSubview(buttonWithImage)
        
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let navItem = UINavigationItem()

        // Add more button
        let rightButton = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: nil)
        rightButton.tintColor = .white
        navItem.rightBarButtonItem = rightButton

        // Add the title label
        let titleLabel = UILabel()
        titleLabel.text = "날씨"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 40)
        titleLabel.sizeToFit()

        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: titleLabel.frame.size.height))
        let titleContainerView = UIView()
        titleContainerView.addSubview(leftPaddingView)
        titleContainerView.addSubview(titleLabel)
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false
        let searchController = UISearchController(searchResultsController: nil)
           searchController.hidesNavigationBarDuringPresentation = false
           searchController.obscuresBackgroundDuringPresentation = false
           searchController.searchBar.tintColor = .white
           searchController.searchBar.searchBarStyle = .minimal
           searchController.searchBar.placeholder = "도시 또는 공항 검색"
           self.navigationItem.searchController = searchController
           self.definesPresentationContext = true
        
        navItem.titleView = titleContainerView

        // Add the search bar below the title
        navItem.searchController = searchController

        navigationBar.setItems([navItem], animated: true)
        
        // Set up the scroll view and button constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor), // Place the scroll view below the navigation bar
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            buttonWithImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            buttonWithImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            buttonWithImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            buttonWithImage.heightAnchor.constraint(equalToConstant: 117)
        ])
    }
    
    let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing  = 0
        return stackView
    }()
    
    
    private var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing  = 0
        return stackView
    }()
    private var scrollView1 : UIScrollView = {
        let view = UIScrollView()
        //           view.backgroundColor = .blue
        return view
    }()
    private var contentView : UIView = {
        let view = UIView()
        //           view.backgroundColor = .green
        return view
    }()
    private var blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private var greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    //
    private var yellowView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    private var whiteView1 : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "backgroundS")
        let tapGesture = UITapGestureRecognizer(target: ViewController.self, action: #selector(partnerProfileTap(_:)))
        view.isUserInteractionEnabled = true
        
        return view
    }()
    @objc
    func partnerProfileTap(_ gesture: UITapGestureRecognizer) {
        print("잉")
    }
    
    private var whiteView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var Text : UILabel = {
        let text = UILabel()
        text.text = "날씨"
        text.textColor = .white
        text.font = UIFont(name: "SFProDisplay-Bold", size: 40)
        
        return text
    }()
    private var whiteView3 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView4 : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var blackView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        self.view.addSubview(leftStackView) // Add leftStackView directly to the view
        self.view.addSubview(rightStackView) // Add rightStackView directly to the view
        
        scrollView.addSubview(contentView)
        
        // Set up constraints for scrollView and contentView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        ])
        
        // Set up constraints for leftStackView and rightStackView
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            leftStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            rightStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            rightStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            rightStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)
        ])
        
        // Add your subviews to leftStackView and rightStackView
        [whiteView1].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            leftStackView.addArrangedSubview($0)
        }
        // Add other subviews to rightStackView as needed
    
        
//        [greenView, blueView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
//                                         $0.heightAnchor.constraint(equalToConstant: 600)])
//            rightStackView.addArrangedSubview($0)
//        }
//
        
        //    private func setLayout(){
        //        self.view.addSubview(stackView)
        //        self.view.addSubview(stackView2)
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView2.translatesAutoresizingMaskIntoConstraints = false
        //
        //        [yelloView,whiteView1,blackView,whiteView2].forEach{
        //            $0.translatesAutoresizingMaskIntoConstraints = false
        //            stackView.addArrangedSubview($0)
        //        }
        //        [whiteView3,greenView,whiteView4,blueView].forEach{
        //            $0.translatesAutoresizingMaskIntoConstraints = false
        //            stackView2.addArrangedSubview($0)
        //        }
        //
        //        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
        //
        //                                     stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
        //                                     stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        //                                     stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2  )])
        //
        //        NSLayoutConstraint.activate([stackView2.topAnchor.constraint(equalTo: self.view.topAnchor),
        //                                     stackView2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        //                                     stackView2.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 0
        //                                                                        ),
        //                                     stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        //
        //
        //    }
        //    private var stackView: UIStackView = {
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.distribution = .fillEqually
        //        stackView.spacing  = 0
        //        return stackView
        //    }()
        //    private var stackView2: UIStackView = {
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.distribution = .fillEqually
        //        stackView.spacing  = 0
        //        return stackView
        //    }()려se
        //    private func setLayout() {
        //        [view1,view2,view3,view4,view5,view6,view7,view8].forEach{ [weak self] view in
        //            guard let self else { return }
        //            // 충돌 방지를 위한 거임
        //            view.translatesAutoresizingMaskIntoConstraints = false //기존 뷰를 버리고 새로운뷰 적용
        //            self.view.addSubview(view) //한 번에 쓰기
        //        }
        //
        //        NSLayoutConstraint.activate([view1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0), view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view1.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view1.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //        NSLayoutConstraint.activate([view2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0), view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0), view2.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view2.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //        NSLayoutConstraint.activate([view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0), view3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view3.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view3.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //
        //
        //        NSLayoutConstraint.activate([view4.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0), view4.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 0), view4.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
        //                                     view4.heightAnchor.constraint(equalToConstant: self.view.frame.height/4)])
        //
        //
        //    NSLayoutConstraint.activate([view5.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0), view5.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0), view5.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
 
    }
    
}
