//
//  TeaherPaywallView + SetupUI.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

extension TeacherPaywallView {
    func setupUI() {
        view.backgroundColor = UIColor(named: "appVioletColor")
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            teacherFeaturesHeaderView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            teacherFeaturesHeaderView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            teacherFeaturesHeaderView.topAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.topAnchor),
            teacherFeaturesHeaderView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([
            teacherFeaturesScrollView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 17),
            teacherFeaturesScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.4 + 17),
            teacherFeaturesScrollView.topAnchor.constraint(equalTo: teacherFeaturesHeaderView.bottomAnchor, constant: 16),
            teacherFeaturesScrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.42 + 20)
        ])
        
        NSLayoutConstraint.activate([
            scForFirstSubscriptionPlan.topAnchor.constraint(equalTo: teacherFeaturesScrollView.bottomAnchor),
            scForFirstSubscriptionPlan.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            scForFirstSubscriptionPlan.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            scForFirstSubscriptionPlan.heightAnchor.constraint(equalToConstant: 10)])
        
        NSLayoutConstraint.activate([
            scForSecondSubscriptionPlan.topAnchor.constraint(equalTo: teacherFeaturesScrollView.bottomAnchor),
            scForSecondSubscriptionPlan.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            scForSecondSubscriptionPlan.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            scForSecondSubscriptionPlan.heightAnchor.constraint(equalToConstant: 10)])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 17),
            priceLabel.topAnchor.constraint(equalTo: teacherFeaturesScrollView.bottomAnchor, constant: 40),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([
            teacherFeaturesFooterView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            teacherFeaturesFooterView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            teacherFeaturesFooterView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: teacherFeaturesFooterView.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    func setupNavigation() {
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    
}
