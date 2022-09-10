//
//  TeacherPaywallRouter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation
import UIKit

protocol TeacherPaywallRouterInput {
    func showModule(with view: UIViewController)
}

final class TeacherPaywallRouter: TeacherPaywallRouterInput {
    
    weak var rootViewController: UIViewController?
    
    func showModule(with view: UIViewController) {
        print("router did receive action")
    }
    
    
}
