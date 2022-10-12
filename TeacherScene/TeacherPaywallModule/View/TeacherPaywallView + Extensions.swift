//
//  TeacherPaywallView + Extensions.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 12.10.2022.
//

import UIKit

extension TeacherPaywallView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.teacherFeatureDataArray.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherFeaturesCell.identifier, for: indexPath) as? TeacherFeaturesCell else {
            return UICollectionViewCell()
        }
        cell.featureImage.image = teacherFeatureDataArray[indexPath.row].featureImage
        cell.featureNameLabel.text = teacherFeatureDataArray[indexPath.row].featureName
        cell.featureDescriptionTextView.text = teacherFeatureDataArray[indexPath.row].featureDescription
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.4, height: UIScreen.main.bounds.height / 2.44)
    }
    
    
    
    
}

// делегат хедера
extension TeacherPaywallView: EBSegmentedControlDelegate {
    func didSelectedSegment(atIndex: Int) {
//        output?.userDidSelectedSegment(at: atIndex)
        setupBackground(with: atIndex == 1)
        changePriceLabelTitle(with: atIndex == 1)
    }
    
    
}

// делегат футера
extension TeacherPaywallView: TeacherPaywallFooterViewDelegate {
    func didClickedOnPrivacyPolicyButton() {
        output?.userDidClickedOnPrivacyPolicyButton()
    }
    
    func didClickedOnTermsOfUseButton() {
        output?.userDidClickOnTermsOfUseButton()
    }
    
    func didClickedOnBuySubscriptionButton() {
        output?.userDidClickedOnBuySubscriptionButton()
    }
    
    
}
