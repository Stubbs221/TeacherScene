//
//  TeacherPaywallView + Extensions.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 12.10.2022.
//

import UIKit


extension TeacherPaywallView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        sc.scroll_did(teacherFeaturesScrollView)
    }
}

// делегат хедера
extension TeacherPaywallView: EBSegmentedControlDelegate {
    func didSelectedSegment(atIndex: Int) {
//        output?.userDidSelectedSegment(at: atIndex)
        setupBackground(with: atIndex == 1)
        changePriceLabelTitle(with: atIndex == 1)
        if atIndex == 1 {
            updateTeacherFeaturesScrollView(with: teacherFullFeatureDataArray)
        } else {
            updateTeacherFeaturesScrollView(with: teacherStarterPackFeatureDataArray)
        }
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
