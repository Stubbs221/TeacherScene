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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4.82).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var featureNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    
    lazy var featureDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 13)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 18
        contentView.layer.shadowRadius = 3
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: -2, height: 2)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false
        
        contentView.addSubview(featureImage)
        contentView.addSubview(featureNameLabel)
        contentView.addSubview(featureDescriptionTextView)
        
        NSLayoutConstraint.activate([
            featureImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            featureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:  -contentView.frame.height / 5 ),
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
