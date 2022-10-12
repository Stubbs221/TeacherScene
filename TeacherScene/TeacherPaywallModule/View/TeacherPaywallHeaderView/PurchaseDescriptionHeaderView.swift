//
//  PurchaseDescriptionHeaderView.swift
//  egebookAdminApp
//
//  Created by Игорь Корабельников on 05.09.2022.
//

import UIKit

class PurchaseDescriptionHeaderView: UIView {
   static let reuseIdentifier = "PurchaseDescriptionHeaderView"
    
   lazy private var descriptionOverSegmentedControlLabel: UILabel = {
       let descriptionLabel = UILabel()
       descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
       descriptionLabel.font = UIFont.systemFont(ofSize: 22.5, weight: .medium)
       descriptionLabel.textColor = .white
       descriptionLabel.attributedText = NSMutableAttributedString(string: "Я буду готовиться к ЕГЭ:", attributes: [NSAttributedString.Key.kern: -0.24])
       descriptionLabel.textAlignment = .left
       descriptionLabel.numberOfLines = 0
       descriptionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
       return descriptionLabel
   }()
    
    lazy private var subscriptionPlanSegmentedControl: UISegmentedControl = {
        let segmentedControlItems = ["самостоятельно", "с преподавателем"]
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.selectedSegmentTintColor = .purpleEBColorSecond
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.removeBorders()
        let segmentedControlFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        let normalSegmentTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purpleEBColor,
                                           NSAttributedString.Key.font: segmentedControlFont]
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.purpleEBColorSecond], for: .normal)
        segmentedControl.setTitleTextAttributes(normalSegmentTextAttributes, for: .normal)
        segmentedControl.addTarget(self, action: #selector(didSelectedSegment(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    lazy private var purchaseDescriptionStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [descriptionOverSegmentedControlLabel, subscriptionPlanSegmentedControl])
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
       stackView.spacing = 16
        
        stackView.distribution = .equalSpacing
       return stackView
    }()
    
    //MARK: Variables
    var delegate: EBSegmentedControlDelegate?
    
   
   //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        presentViews()
    }
    
    func setDescription(descriptionText: String, delegate: EBSegmentedControlDelegate) {
        self.delegate = delegate
        descriptionOverSegmentedControlLabel.attributedText = NSMutableAttributedString(string: descriptionText, attributes: [NSAttributedString.Key.kern: -0.24])
    }
    //MARK: Present Views
    
    private func presentViews() {
        setSubscriptionPlanSegmentedControl()
        presentStackView()
    }
    
    private func presentStackView() {
        addSubview(purchaseDescriptionStackView)
        NSLayoutConstraint.activate([
            purchaseDescriptionStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            purchaseDescriptionStackView.topAnchor.constraint(equalTo: topAnchor),
            purchaseDescriptionStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            purchaseDescriptionStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    private func setSubscriptionPlanSegmentedControl() {
        addSubview(subscriptionPlanSegmentedControl)
        NSLayoutConstraint.activate([subscriptionPlanSegmentedControl.heightAnchor.constraint(equalToConstant: 47)])
    }
    
    //MARK: Actions
    
    @objc private func didSelectedSegment(_ sender: UISegmentedControl) {
        delegate?.didSelectedSegment(atIndex: sender.selectedSegmentIndex)
        print("Did selectedSegment")
    }
}
