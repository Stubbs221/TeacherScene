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
    
}

class TeacherPaywallView: UIViewController, TeacherPaywallViewInput {
    
    
    var output: TeacherPaywallViewOutput?
    
    var teacherFeatureDataArray: [FeatureModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        
        // Do any additional setup after loading the view.
    }
    
//  MARK: UI Elements
    
    lazy var teacherFeatureCollectionViewCarousel: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
}
