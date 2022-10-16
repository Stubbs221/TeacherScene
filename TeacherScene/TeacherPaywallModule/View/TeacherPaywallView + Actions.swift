//
//  TeacherPaywallView + Actionis.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 13.10.2022.
//

import UIKit
import SCPageControl

extension TeacherPaywallView {
    func updateTeacherFeaturesScrollView(with data: [FeatureModel]) {
        
        

        
        self.changeScrollViewOffsetToZero()
        
        if data.count == teacherStarterPackFeatureDataArray.count {
            self.isStarterPackFeatureSegmentStateSelected = true
            self.scForFirstSubscriptionPlan.isHidden = false
            self.scForSecondSubscriptionPlan.isHidden = true
                } else {
                    self.isStarterPackFeatureSegmentStateSelected = false
                    self.scForFirstSubscriptionPlan.isHidden = true
                    self.scForSecondSubscriptionPlan.isHidden = false
                }
        
        
        for subview in self.teacherFeaturesScrollView.subviews {
            subview.removeFromSuperview()
        }
        
        self.timer.invalidate()
    
        self.timer = Timer()
        
        for (i, feature) in data.enumerated() {
            teacherFeaturesScrollView.addSubview(addPage(with: feature, at: i))
        }
        
        self.teacherFeaturesScrollView.contentSize = CGSize(width: ((UIScreen.main.bounds.width / 1.4) * CGFloat(data.count) + CGFloat(10 * (data.count))), height: UIScreen.main.bounds.height / 2.44)
        
        
//        scForFirstSubscriptionPlan = SCPageControlView()
//
        
        self.changeScrollViewOffsetUsingTimer()
    }
    
    func addPage(with feature: FeatureModel, at position: Int) -> UIView {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = true
        
        let contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = feature.backgroundColor
            view.layer.cornerRadius = 18
            view.layer.shadowRadius = 3
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: -2, height: 2)
            view.layer.shadowOpacity = 0.2
            view.layer.masksToBounds = false
            view.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2.44)).isActive = true
            view.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 1.4)).isActive = true
            return view
        }()
        
        lazy var featureImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = feature.featureImage
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.82).isActive = true
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var featureNameLabel: UILabel = {
            let label = UILabel()
            label.adjustsFontSizeToFitWidth = true
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = feature.featureName
            label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
            return label
        }()
        
        lazy var featureDescriptionTextView: UILabel = {
            let textView = UILabel()
            textView.translatesAutoresizingMaskIntoConstraints = false
//            textView.isScrollEnabled = false
//            textView.sizeToFit()
//            textView.adjustsFontForContentSizeCategory = true
            textView.adjustsFontSizeToFitWidth = true
            textView.text = feature.featureDescription
            textView.font = UIFont.systemFont(ofSize: 13)
            textView.numberOfLines = 5
//            textView.isEditable = false
//            textView.isUserInteractionEnabled = false
            
//            textView.backgroundColor = feature.backgroundColor
            return textView
        }()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let xPos = Int((screenWidth / 1.4)) * position + 17 * position
        
        mainView.frame = CGRect(
            x: CGFloat(xPos),
            y: 10,
            width: CGFloat(screenWidth / 1.4),
            height: CGFloat(screenHeight / 2.44))
        
        mainView.addSubview(contentView)
        contentView.addSubview(featureImage)
        contentView.addSubview(featureNameLabel)
        contentView.addSubview(featureDescriptionTextView)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            featureImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            featureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:  -50 ),
        ])
        NSLayoutConstraint.activate([
            featureNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            featureNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            featureNameLabel.topAnchor.constraint(equalTo: featureImage.bottomAnchor, constant: 20)])
        NSLayoutConstraint.activate([
            featureDescriptionTextView.leadingAnchor.constraint(equalTo: featureNameLabel.leadingAnchor),
            featureDescriptionTextView.trailingAnchor.constraint(equalTo: featureNameLabel.trailingAnchor),
            featureDescriptionTextView.topAnchor.constraint(equalTo: featureNameLabel.bottomAnchor),
            featureDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
        
//        featureDescriptionTextView.updateTextFont()
        
        return mainView
    }
    
    func changeScrollViewOffsetUsingTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.5, repeats: true, block: { [ weak self ] _ in
            guard let self = self else { return }
            let scrollWidth = self.teacherFeaturesScrollView.bounds.width
            let currentXOffset = self.teacherFeaturesScrollView.contentOffset.x
            
            
            let lastXPos = currentXOffset + scrollWidth
            if lastXPos < self.teacherFeaturesScrollView.contentSize.width {
                print("Scroll")
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                            self.teacherFeaturesScrollView.contentOffset.x = lastXPos
                        }, completion: nil )
                }
            } else {
                print("Scroll to start")
                self.teacherFeaturesScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        })
    }
    
    func changeScrollViewOffsetToZero() {
        self.teacherFeaturesScrollView.contentOffset = CGPoint(x: 0, y: 0)
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
