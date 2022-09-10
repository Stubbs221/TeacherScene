//
//  TeacherCourseRouter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation
import UIKit

protocol TeacherCourseRouterInput {
    func showModule(with view: UIViewController)
}

final class TeacherCourseRouter: TeacherCourseRouterInput {
    
    weak var rootViewController: UIViewController?
    
    func showModule(with view: UIViewController) {
        print("router did receive action")
    }
}
