//
//  TaacherCourseTableViewSectionHeader.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 01.10.2022.
//

import UIKit

class TeacherCourseTableViewSectionHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "Header"
    
    lazy var sectionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSectionHeader(with title: String) {
        backgroundColor = .cyan
        contentView.backgroundColor = .cyan
        contentView.addSubview(sectionLabel)
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.size.width).isActive = true
        
        NSLayoutConstraint.activate([
            sectionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sectionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        self.sectionLabel.text = title
    }
}
