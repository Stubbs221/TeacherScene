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
            teacherFeaturesCollectionView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            teacherFeaturesCollectionView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            teacherFeaturesCollectionView.topAnchor.constraint(equalTo: teacherFeaturesHeaderView.bottomAnchor),
            teacherFeaturesCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.42 + 20)
        ])
        
        NSLayoutConstraint.activate([
            pageConrol.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 17),
            pageConrol.topAnchor.constraint(equalTo: teacherFeaturesCollectionView.bottomAnchor),
            pageConrol.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 17),
            priceLabel.topAnchor.constraint(equalTo: pageConrol.bottomAnchor, constant: 20),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([
            teacherFeaturesFooterView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            teacherFeaturesFooterView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            teacherFeaturesFooterView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            teacherFeaturesFooterView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)])
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
