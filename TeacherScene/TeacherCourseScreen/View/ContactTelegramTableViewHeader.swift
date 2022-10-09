//
//  ContactTelegramTableViewHeader.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 26.09.2022.
//

import UIKit

protocol ContactTelegramTableViewHeaderDelegate: AnyObject {
    func contactWithTelegramButton()
}

class ContactTelegramTableViewHeader: UITableViewHeaderFooterView {

    weak var delegate: ContactTelegramTableViewHeaderDelegate?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return view
    }()
    
    lazy var telegramLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
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
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        button.heightAnchor.constraint(equalToConstant: 43).isActive = true
        button.widthAnchor.constraint(equalToConstant: 283).isActive = true
        button.addTarget(self, action: #selector(contactWithTelegramButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure(with: "Телеграм-чат для связи с преподавателем ")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true

        addSubview(telegramLabel)
        telegramLabel.text = text
        addSubview(contactWithTelegramButton)
        
        NSLayoutConstraint.activate([
            telegramLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            telegramLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            telegramLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([
            contactWithTelegramButton.leadingAnchor.constraint(equalTo: telegramLabel.leadingAnchor),
            contactWithTelegramButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)])
    }
    
    @objc func contactWithTelegramButtonTapped() {
        self.delegate?.contactWithTelegramButton()
    }
}
