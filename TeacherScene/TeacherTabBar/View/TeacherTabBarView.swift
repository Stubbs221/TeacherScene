//
//  TeacherTabBarView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 03.10.2022.
//

import UIKit

class TeacherTabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        UITabBar.appearance().barTintColor = .systemGray6
        
        tabBar.tintColor = UIColor(named: "appVioletColor")
        
        setupVCs()
        // Do any additional setup after loading the view.
    }
    
    func setupVCs() {
        viewControllers = [
            TeacherCourseModuleBuilder.build(usingNavgationFactory: NavigationBuilder.build),
            TeacherCourseModuleBuilder.build(usingNavgationFactory: NavigationBuilder.build),
            TeacherCourseModuleBuilder.build(usingNavgationFactory: NavigationBuilder.build)
        ]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
