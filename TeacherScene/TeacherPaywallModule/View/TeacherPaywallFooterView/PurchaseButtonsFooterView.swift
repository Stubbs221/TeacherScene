//
//  PurchaseButtonsFooterView.swift
//  egebookAdminApp
//
//  Created by Игорь Корабельников on 04.09.2022.
//

import UIKit

class TeacherPaywallFooterView: UIView {
    
    //MARK: IBOutlets
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 22.5, weight: .medium)
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 0
        priceLabel.textColor = .white
        return priceLabel
    }()
    
    lazy var buySubscriptionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundColor(.white, forState: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Купить подписку", for: .normal)
//        button.heightAnchor.constraint(equalToConstant: 47).isActive = true
        button.addTarget(self, action: #selector(buySubscriptionButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsOfUseButton: UIButton = {
        let termsOfUseButton = UIButton(type: .system)
        termsOfUseButton.translatesAutoresizingMaskIntoConstraints = false
        termsOfUseButton.setTitle("Условия соглашения", for: .normal)
        termsOfUseButton.tintColor = .white
        termsOfUseButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        termsOfUseButton.addTarget(self, action: #selector(openTermsOfUseButtonAction), for: .touchUpInside)
        return termsOfUseButton
    }()
    
    private lazy var privacyPolicyButton: UIButton = {
        let privacyPolicyButton = UIButton(type: .system)
        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.setTitle("Политика конфиденциональности", for: .normal)
        privacyPolicyButton.tintColor = .white
        privacyPolicyButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        privacyPolicyButton.addTarget(self, action: #selector(openPrivacyPolicy), for: .touchUpInside)
        return privacyPolicyButton
    }()
    
    lazy var additionalInformationButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [termsOfUseButton, privacyPolicyButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return stackView
    }()
    
    lazy var buyButtonsFooterStackView: UIStackView = {
        let buyButtonsFooterStackView = UIStackView(arrangedSubviews: [priceLabel,buySubscriptionButton, additionalInformationButtonsStackView])
        buyButtonsFooterStackView.translatesAutoresizingMaskIntoConstraints = false
        buyButtonsFooterStackView.axis = .vertical
        buyButtonsFooterStackView.alignment = .leading
        
        buyButtonsFooterStackView.spacing = 17
        if UIScreen.main.bounds.height == 667 {
            buyButtonsFooterStackView.setCustomSpacing(26, after: buySubscriptionButton)
        } else {
            buyButtonsFooterStackView.setCustomSpacing(50, after: buySubscriptionButton)
        }

        
        buyButtonsFooterStackView.distribution = .fill
        return buyButtonsFooterStackView
    }()
    
    //MARK: Properties
    static let reuseidentifier = "PurchaseButtonsFooterView"
    var delegate: TeacherPaywallFooterViewDelegate?
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(subscriptionPlanPrice: Int) {
        priceLabel.text = "\(subscriptionPlanPrice) руб/мес"
    }
    
    //MARK: View Presentation
    
    func commonInit() {
        setButtonConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        
        presentMainStackView()
    }
    
    private func presentMainStackView() {
        addSubview(buyButtonsFooterStackView)
        NSLayoutConstraint.activate([
            buyButtonsFooterStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            buyButtonsFooterStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),
            buyButtonsFooterStackView.topAnchor.constraint(equalTo: topAnchor),
            buyButtonsFooterStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setButtonConstraints() {
        NSLayoutConstraint.activate([
            buySubscriptionButton.heightAnchor.constraint(equalToConstant: 47),
            buySubscriptionButton.widthAnchor.constraint(equalToConstant: 282)
        ])
    }
    
    
    
    //MARK: Actions
    
    @objc func openPrivacyPolicy() {
        delegate?.didClickedOnPrivacyPolicyButton()
    }
    
    @objc func openTermsOfUseButtonAction() {
        delegate?.didClickedOnTermsOfUseButton()
    }
    
    @objc func buySubscriptionButtonAction() {
        delegate?.didClickedOnBuySubscriptionButton()
    }

}
