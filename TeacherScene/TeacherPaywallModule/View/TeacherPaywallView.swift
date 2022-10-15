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
    
    var teacherFullFeatureDataArray: [FeatureModel] = [FeatureModel](repeating: FeatureModel(image: UIImage(named: "taskMockImage")!, name: "Опытный наставник", description: "15 лет опыта работа \nDungeon master \nPerfomance artist", backgroundColor: .white), count: 3)
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        
        backgroundImageView.addSubview(teacherFeaturesHeaderView)
        backgroundImageView.addSubview(teacherFeaturesScrollView)
//        pageView для первого плана подписки
        backgroundImageView.addSubview(scForFirstSubscriptionPlan)
//        pageView для второго плана подписки
        backgroundImageView.addSubview(scForSecondSubscriptionPlan)
        backgroundImageView.addSubview(priceLabel)
        backgroundImageView.addSubview(teacherFeaturesFooterView)
        setupUI()
        setupNavigation()
        setupBackground(with: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateTeacherFeaturesScrollView(with: teacherStarterPackFeatureDataArray)
//        changeScrollViewOffsetUsingTimer()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    
    lazy var scForFirstSubscriptionPlan: SCPageControlView = {
        let sc = SCPageControlView()
        
        sc.frame = CGRect(x: 0, y: 0, width: self.teacherStarterPackFeatureDataArray.count * 28, height: 10)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.scp_style = .SCNormal
        sc.set_view(self.teacherStarterPackFeatureDataArray.count, current: 0, current_color: .white, disable_color: UIColor.hexStringToUIColor(hex: "D9D9D9"))
        
        return sc
    }()
    
    lazy var scForSecondSubscriptionPlan: SCPageControlView = {
        let sc = SCPageControlView()
        
        sc.frame = CGRect(x: 0, y: 0, width: self.teacherFullFeatureDataArray.count * 28, height: 10)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.scp_style = .SCNormal
        sc.set_view(self.teacherFullFeatureDataArray.count, current: 0, current_color: .white, disable_color: UIColor.hexStringToUIColor(hex: "D9D9D9"))
        sc.isHidden = true
        return sc
    }()
    
       
}


