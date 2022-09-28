//
//  TeacherCourseView + SetupUI.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 26.09.2022.
//

import UIKit

extension TeacherCourseView {
    func setupUI() {
        view.addSubview(teacherCourseTableView)
        
        NSLayoutConstraint.activate([
            teacherCourseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teacherCourseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teacherCourseTableView.topAnchor.constraint(equalTo: view.topAnchor),
            teacherCourseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func setupNavigation() {
        
    }
}
