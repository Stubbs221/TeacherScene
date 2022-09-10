//
//  TeaherPaywallView + SetupUI.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

extension TeacherPaywallView {
    func setupUI() {
        view.backgroundColor = UIColor(named: "appVioletColor")
        
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Курс"
        
//        navigationController?.navigationBar.topItem?.titleView?.tintColor = .white
    }
}
