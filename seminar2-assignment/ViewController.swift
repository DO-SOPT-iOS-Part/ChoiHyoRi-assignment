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
    
    
    @objc func tapCodePushButton() {
        //        let vc = WeatherViewController()
        //
        //          self.navigationController?.pushViewController(vc, animated: true)
        let svc = WeatherViewController()
        svc.modalPresentationStyle = .fullScreen
        self.present(svc, animated: true, completion: nil)
    }
    
    private var buttonWithImage: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setImage(UIImage(named: "backgroundS"), for: .normal)

        
        let myLocationLabel = UILabel()
        myLocationLabel.text = "나의 위치"
        myLocationLabel.font =  UIFont(name: "SFProDisplay-Bold", size: 34)
        myLocationLabel.textColor = .white
        
        let locationLabel = UILabel()
        locationLabel.text = "의정부시"
        locationLabel.font = UIFont(name: "SFProDisplay-Bold", size: 17)
        locationLabel.textColor = .white
        
        let weatherLabel = UILabel()
        weatherLabel.text = "흐림"
        weatherLabel.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        weatherLabel.textColor = .white
        
        let temperatureLabel = UILabel()
        temperatureLabel.text = "21°"
        temperatureLabel.font = UIFont(name: "SFProDisplay-Light", size: 52)
        temperatureLabel.textColor = .white
        
        let maxmin = UILabel()
        maxmin.text = "최고: 29° 최저: 15°"
        maxmin.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        maxmin.textColor = .white
        
        
        [myLocationLabel, locationLabel, weatherLabel, temperatureLabel, maxmin].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            buttonView.addSubview($0)
        }
        NSLayoutConstraint.activate([myLocationLabel.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 15),
                                     myLocationLabel.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 40)])
        NSLayoutConstraint.activate([locationLabel.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 55),
                                     locationLabel  .leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 40)])
        NSLayoutConstraint.activate([weatherLabel.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 87),
                                     weatherLabel.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 40)])
        NSLayoutConstraint.activate([temperatureLabel.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 4),
                                     temperatureLabel.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 280)])
        NSLayoutConstraint.activate([maxmin.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 87),
                                     maxmin.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor, constant: 200)])
    
    buttonView.addTarget(self, action: #selector(tapCodePushButton), for: .touchUpInside)
    
        return buttonView
}()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .black
            
            
            self.view.addSubview(navigationBar)
            self.view.addSubview(scrollView)
            scrollView.addSubview(buttonWithImage)
            
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            let navItem = UINavigationItem()
            
            let rightButton = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: nil)
            rightButton.tintColor = .white
            navItem.rightBarButtonItem = rightButton
            
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
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor), scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
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
        
        
   
        private func setLayout() {
            self.view.addSubview(scrollView)
            
            scrollView.addSubview(contentView)
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
            
      
        }
        
};

