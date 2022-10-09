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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSectionHeader(with title: String) {
        
        contentView.addSubview(sectionLabel)

        NSLayoutConstraint.activate([
            sectionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sectionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        self.sectionLabel.text = title
    }
}
