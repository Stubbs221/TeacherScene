//
//  NavigationBuilder.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.prefersLargeTitles = true
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        return navigationController
    }
}
