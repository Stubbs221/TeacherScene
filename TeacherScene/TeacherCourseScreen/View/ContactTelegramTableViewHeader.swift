//
//  ContactTelegramTableViewHeader.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 26.09.2022.
//

import UIKit

class ContactTelegramTableViewHeader: UITableViewHeaderFooterView {

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
        button.setImage(UIImage(named: "telegramIcon"), for: .normal)
        button.imageEdgeInsets.right = 50
        return button
    }()
    
    func configure(with text: String) {
        containerView.addSubview(telegramLabel)
        containerView.addSubview(contactWithTelegramButton)
        
        NSLayoutConstraint.activate([
            telegramLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            telegramLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15)])
        NSLayoutConstraint.activate([
            contactWithTelegramButton.leadingAnchor.constraint(equalTo: telegramLabel.leadingAnchor),
            contactWithTelegramButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15)])
    }
    
    
}
