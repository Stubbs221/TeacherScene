//
//  TeacherPaywallView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

protocol TeacherPaywallViewInput {
    var output: TeacherPaywallViewOutput? { get set }
}

protocol TeacherPaywallViewOutput {
    
}

class TeacherPaywallView: UIViewController, TeacherPaywallViewInput {
    
    
    var output: TeacherPaywallViewOutput?
    

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
