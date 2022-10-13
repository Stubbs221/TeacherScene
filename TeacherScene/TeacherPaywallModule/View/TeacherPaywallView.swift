//
//  TeacherPaywallView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit
import SCPageControl

protocol TeacherPaywallViewInput: AnyObject {
    var output: TeacherPaywallViewOutput? { get set }
    var teacherStarterPackFeatureDataArray: [FeatureModel] { get set }
}

protocol TeacherPaywallViewOutput {
//    func userDidSelectedSegment(at index: Int)
    func userDidClickedOnPrivacyPolicyButton()
    func userDidClickOnTermsOfUseButton()
    func userDidClickedOnBuySubscriptionButton()
}

class TeacherPaywallView: UIViewController, TeacherPaywallViewInput {
    
    
    var output: TeacherPaywallViewOutput?
    
    var teacherStarterPackFeatureDataArray: [FeatureModel] = [FeatureModel](repeating: FeatureModel(image: UIImage(named: "teacherImage")!, name: "Опытный наставник", description: "15 лет опыта работа \nФакты о репетиторе \nФакты о репетиторе ", backgroundColor: .white), count: 5)
    
    var teacherFullFeatureDataArray: [FeatureModel] = [FeatureModel](repeating: FeatureModel(image: UIImage(named: "taskMockImage")!, name: "Опытный наставник", description: "15 лет опыта работа \nDungeon master \nPerfomance artist", backgroundColor: .purpleEBColorSecond), count: 5)
    
//    var dataToScrollView: [FeatureModel] = []
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        teacherFeaturesCollectionView.delegate = self
//        teacherFeaturesCollectionView.dataSource = self
        
        view.addSubview(backgroundImageView)
        
//        backgroundImageView.addSubview(teacherFeaturesCollectionView)
        backgroundImageView.addSubview(teacherFeaturesHeaderView)
        backgroundImageView.addSubview(teacherFeaturesScrollView)
//        backgroundImageView.addSubview(pageControl)
        backgroundImageView.addSubview(sc)
        backgroundImageView.addSubview(priceLabel)
        backgroundImageView.addSubview(teacherFeaturesFooterView)
        setupUI()
        setupNavigation()
        setupBackground(with: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.dataToScrollView = self.teacherStarterPackFeatureDataArray
        self.updateTeacherFeaturesScrollView(with: teacherStarterPackFeatureDataArray)
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { [ weak self ] _ in
            guard let self = self else { return }
            let scrollWidth = self.teacherFeaturesScrollView.bounds.width
            let currentXOffset = self.teacherFeaturesScrollView.contentOffset.x
            
            
            let lastXPos = currentXOffset + scrollWidth
            if lastXPos < self.teacherFeaturesScrollView.contentSize.width {
                print("Scroll")
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                            self.teacherFeaturesScrollView.contentOffset.x = lastXPos
                        }, completion: nil )
                }
            } else {
                print("Scroll to start")
//                DispatchQueue.main.async {
//                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
//                            self.teacherFeaturesScrollView.contentOffset.x = -lastXPos
//                        }, completion: nil )
//                }
                self.teacherFeaturesScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        })
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        collectionView.frame = view.bounds
    }
    
    //  MARK: UI Elements
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var teacherFeaturesHeaderView: PurchaseDescriptionHeaderView = {
        let view = PurchaseDescriptionHeaderView()
        view.delegate = self
        return view
    }()
    
    lazy var teacherFeaturesFooterView: TeacherPaywallFooterView = {
        let view = TeacherPaywallFooterView()
        view.delegate = self
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        label.text = "299 руб/мес"
        return label
    }()
    
    lazy var teacherFeaturesScrollView: UIScrollView = {
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: ((UIScreen.main.bounds.width / 1.4) * CGFloat(teacherStarterPackFeatureDataArray.count) + CGFloat(10 * (teacherStarterPackFeatureDataArray.count) + 30)), height: UIScreen.main.bounds.height / 2.44)
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
        scrollView.delegate = self
        

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var sc: SCPageControlView = {
        let sc = SCPageControlView()
        
        sc.frame = CGRect(x: 0, y: 0, width: 140, height: 10)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.scp_style = .SCNormal
        sc.set_view(self.teacherStarterPackFeatureDataArray.count, current: 0, current_color: .white, disable_color: UIColor.hexStringToUIColor(hex: "D9D9D9"))
        return sc
    }()
    
    func updateTeacherFeaturesScrollView(with data: [FeatureModel]) {
//        self.dataToScrollView = data
        for subview in self.teacherFeaturesScrollView.subviews {
            subview.removeFromSuperview()
        }
        

//        self.sc.removeFromSuperview()
//        view.addSubview(sc)
//        self.sc.set_view(0, current: 0, current_color: .clear, disable_color: .clear)
//        self.sc.set_view(data.count, current: 0, current_color: .white, disable_color: UIColor.hexStringToUIColor(hex: "D9D9D9"))
        
        for (i, feature) in data.enumerated() {
            teacherFeaturesScrollView.addSubview(addPage(with: feature, at: i))
        }
    }
    
    func addPage(with feature: FeatureModel, at position: Int) -> UIView {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = true
        
        let contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = feature.backgroundColor
            view.layer.cornerRadius = 18
            view.layer.shadowRadius = 3
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: -2, height: 2)
            view.layer.shadowOpacity = 0.2
            view.layer.masksToBounds = false
            view.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2.44)).isActive = true
            view.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 1.4)).isActive = true
            return view
        }()
        
        lazy var featureImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = feature.featureImage
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.82).isActive = true
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var featureNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = feature.featureName
            label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
            return label
        }()
        
        lazy var featureDescriptionTextView: UITextView = {
            let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.text = feature.featureDescription
            textView.font = UIFont.systemFont(ofSize: 13)
            textView.isEditable = false
            textView.isUserInteractionEnabled = false
            
            textView.backgroundColor = feature.backgroundColor
            return textView
        }()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let xPos = Int((screenWidth / 1.4)) * position + 17 * position
        
        mainView.frame = CGRect(
            x: CGFloat(xPos),
            y: 10,
            width: CGFloat(screenWidth / 1.4),
            height: CGFloat(screenHeight / 2.44))
        
        mainView.addSubview(contentView)
        contentView.addSubview(featureImage)
        contentView.addSubview(featureNameLabel)
        contentView.addSubview(featureDescriptionTextView)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            featureImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            featureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:  -50 ),
        ])
        NSLayoutConstraint.activate([
            featureNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            featureNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            featureNameLabel.topAnchor.constraint(equalTo: featureImage.bottomAnchor, constant: 20)])
        NSLayoutConstraint.activate([
            featureDescriptionTextView.leadingAnchor.constraint(equalTo: featureNameLabel.leadingAnchor),
            featureDescriptionTextView.trailingAnchor.constraint(equalTo: featureNameLabel.trailingAnchor),
            featureDescriptionTextView.topAnchor.constraint(equalTo: featureNameLabel.bottomAnchor),
            featureDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
        
        return mainView
    }
    
    public enum SCPageStyle: Int {
        case SCNormal = 100
        case SCJAMoveCircle
        case SCJAFillCircle
        case SCJAFlatBar
    }
    
    
}


