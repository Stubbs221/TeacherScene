//
//  ContactTelegramTableViewHeader.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 26.09.2022.
//

import UIKit

class ContactTelegramTableViewHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "ContactTelegramHeader"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return view
    }()
    
    lazy var telegramLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    lazy var contactWithTelegramButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "appVioletColor")
        button.setTitle("Присоедениться", for: .normal)
//        button.titleLabel?.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        button.setImage(UIImage(named: "telegramIcon"), for: .normal)
        button.titleLabel?.semanticContentAttribute = .forceRightToLeft
        button.imageView?.contentMode = .scaleAspectFit
        button.semanticContentAttribute = .forceRightToLeft
//        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -20).isActive = true
//        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: -350)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
//        button.imageView?.frame.size = CGSize(width: 20, height: 20)
        button.heightAnchor.constraint(equalToConstant: 43).isActive = true
        button.widthAnchor.constraint(equalToConstant: 283).isActive = true
        return button
    }()
    
    func configure(with text: String) {
        
//        contentView.backgroundColor = .cyan
//        containerView.addSubview(telegramLabel)
//        containerView.addSubview(contactWithTelegramButton)
//
//        NSLayoutConstraint.activate([
//            telegramLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
//            telegramLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15)])
//        NSLayoutConstraint.activate([
//            contactWithTelegramButton.leadingAnchor.constraint(equalTo: telegramLabel.leadingAnchor),
//            contactWithTelegramButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)])
        
        contentView.addSubview(telegramLabel)
        telegramLabel.text = text
        contentView.addSubview(contactWithTelegramButton)
        
        NSLayoutConstraint.activate([
            telegramLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            telegramLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            telegramLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([
            contactWithTelegramButton.leadingAnchor.constraint(equalTo: telegramLabel.leadingAnchor),
            contactWithTelegramButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }
    
//    override init(containerView: UIView, telegramLabel: UILabel, contactWithTelegramButton: UIButton) {
//
//        super.init(reuseIdentifier: self.reuseIdentifier)
//        self.containerView = containerView
//        self.telegramLabel = telegramLabel
//        self.contactWithTelegramButton = contactWithTelegramButton
//    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
