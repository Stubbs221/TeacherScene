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
            sc.topAnchor.constraint(equalTo: teacherFeaturesScrollView.bottomAnchor),
            sc.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            sc.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            sc.heightAnchor.constraint(equalToConstant: 10)])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 17),
            priceLabel.topAnchor.constraint(equalTo: sc.bottomAnchor, constant: 30),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([
            teacherFeaturesFooterView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            teacherFeaturesFooterView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            teacherFeaturesFooterView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
//            teacherFeaturesFooterView.bottomAnchor.constraint(equalTo: safeare.bottomAnchor, constant: -20)
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: teacherFeaturesFooterView.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    func setupNavigation() {
        //        navigationController?.navigationBar.topItem?.title = "Курс"
        navigationController?.navigationBar.prefersLargeTitles = false
        //        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupBackground(with state: Bool) {
            let gradient = CAGradientLayer()
            var bounds = view.bounds
            gradient.frame = bounds
            gradient.colors = [UIColor.hexStringToUIColor(hex: "C36BE5").cgColor, UIColor.hexStringToUIColor(hex: "7478DC").cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImage(from: gradient) {
                
                if !state  {
                    UIView.transition(with: backgroundImageView,
                                      duration: 0.75,
                                      options: .transitionCrossDissolve,
                                      animations: { self.backgroundImageView.image = image },
                                      completion: nil)
                } else {
                    UIView.transition(with: backgroundImageView,
                                      duration: 0.75,
                                      options: .transitionCrossDissolve,
                                      animations: { self.backgroundImageView.image =  UIImage.imageWithColor(color: UIColor.hexStringToUIColor(hex: "C36BE5"), size: self.view.bounds.size)},
                                      completion: nil)
            }
        }
        
    }
    
    func changePriceLabelTitle(with state: Bool) {
        if !state  {
            UIView.transition(with: priceLabel,
                              duration: 0.75,
                              options: .transitionCrossDissolve,
                              animations: { self.priceLabel.text = "299 руб/мес" },
                              completion: nil)
        } else {
            UIView.transition(with: priceLabel,
                              duration: 0.75,
                              options: .transitionCrossDissolve,
                              animations: { self.priceLabel.text = "449 руб/мес"},
                              completion: nil)
        }
    }
    
    func getImage(from gradientLayer: CAGradientLayer) -> UIImage? {
            var gradientImage: UIImage?
            UIGraphicsBeginImageContext(gradientLayer.frame.size)
            if let context = UIGraphicsGetCurrentContext() {
                gradientLayer.render(in: context)
                gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
    
            }
            UIGraphicsEndImageContext()
            return gradientImage
        }
}
