//
//  TeacherFeaturesCell.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

class TeacherFeaturesCell: UICollectionViewCell {
    
    static let identifier = "teacherFeature"
    
    lazy var featureImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var featureNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var featureDescriptionTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override convenience init(frame: CGRect) {
        self.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 18
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.masksToBounds = false
        
        contentView.addSubview(featureImage)
        contentView.addSubview(featureNameLabel)
        contentView.addSubview(featureDescriptionTextView)
        
        NSLayoutConstraint.activate([
            featureImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            featureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:  -contentView.frame.height / 4 ),
        ])
        NSLayoutConstraint.activate([
            featureNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            featureNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            featureNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20)])
        NSLayoutConstraint.activate([
            featureDescriptionTextView.leadingAnchor.constraint(equalTo: featureNameLabel.leadingAnchor),
            featureDescriptionTextView.trailingAnchor.constraint(equalTo: featureNameLabel.trailingAnchor),
            featureDescriptionTextView.topAnchor.constraint(equalTo: featureNameLabel.bottomAnchor, constant: 10),
            featureDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
}
