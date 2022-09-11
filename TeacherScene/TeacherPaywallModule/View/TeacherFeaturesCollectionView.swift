//
//  TeacherFeatureCollectionView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

class TeacherFeaturesCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var teacherPaywallView: TeacherPaywallViewInput?
    
    init(parentVC: TeacherPaywallViewInput) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.teacherPaywallView = parentVC
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = UIColor(named: "appBlueColor")
        delegate = self
        dataSource = self
        register(TeacherFeaturesCell.self, forCellWithReuseIdentifier: TeacherFeaturesCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.teacherFeatureMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 10, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let view = teacherPaywallView,
              !view.teacherFeatureDataArray.isEmpty else { return 0 }
        return view.teacherFeatureDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherFeaturesCell.identifier, for: indexPath) as? TeacherFeaturesCell,
            let view = teacherPaywallView else { return UICollectionViewCell() }
        cell.featureImage.image = view.teacherFeatureDataArray[indexPath.row].featureImage
        cell.featureNameLabel.text = view.teacherFeatureDataArray[indexPath.row].featureName
        cell.featureDescriptionTextView.text = view.teacherFeatureDataArray[indexPath.row].featureDescription
        return cell
    }
    

    struct Constants {
        static let leftDistanceToView: CGFloat = 40
        static let rightDistanceToView: CGFloat = 60
        static let teacherFeatureMinimumLineSpacing: CGFloat = 10
        static let teacherFeatureItemLength = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - teacherFeatureMinimumLineSpacing )
    }

}
