//
//  TeacherPaywallView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

protocol TeacherPaywallViewInput: AnyObject {
    var output: TeacherPaywallViewOutput? { get set }
    var teacherFeatureDataArray: [FeatureModel] { get set }
}

protocol TeacherPaywallViewOutput {
//    func userDidSelectedSegment(at index: Int)
    func userDidClickedOnPrivacyPolicyButton()
    func userDidClickOnTermsOfUseButton()
    func userDidClickedOnBuySubscriptionButton()
}

class TeacherPaywallView: UIViewController, TeacherPaywallViewInput {
    
    
    var output: TeacherPaywallViewOutput?
    
    var teacherFeatureDataArray: [FeatureModel] = [FeatureModel](repeating: FeatureModel(image: UIImage(named: "teacherImage")!, name: "Опытный наставник", description: "15 лет опыта работа \nФакты о репетиторе \nФакты о репетиторе "), count: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teacherFeaturesCollectionView.delegate = self
        teacherFeaturesCollectionView.dataSource = self
        
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(teacherFeaturesCollectionView)
        backgroundImageView.addSubview(teacherFeaturesHeaderView)
        backgroundImageView.addSubview(pageControl)
        backgroundImageView.addSubview(priceLabel)
        backgroundImageView.addSubview(teacherFeaturesFooterView)
        setupUI()
        setupNavigation()
        setupBackground(with: false)
        
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
    
    lazy var teacherFeaturesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TeacherFeaturesCell.self, forCellWithReuseIdentifier: TeacherFeaturesCell.identifier)
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
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
    
    lazy var pageConrol: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 5
        pageControl.currentPage = 1

        return pageControl
    }()
    lazy var pageControl: ExtendedPageControll = {
        let pageControl = ExtendedPageControll(numberOfPages: self.teacherFeatureDataArray.count, currentPage: 0, isCircular: true)
        pageControl.currentIndicatorColor = .black
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
    struct Constants {
        static let leftDistanceToView: CGFloat = 16
        static let rightDistanceToView: CGFloat = 5
        static let teacherFeatureMinimumLineSpacing: CGFloat = 10
        static let teacherFeatureItemLength = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - teacherFeatureMinimumLineSpacing )
    }
}


