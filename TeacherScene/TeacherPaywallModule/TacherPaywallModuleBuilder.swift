//
//  TacherPaywallModuleBuilder.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

class TeacherPaywallModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = TeacherPaywallView()
        let interactor = TeacherPaywallInteractor()
        let router = TeacherPaywallRouter()
        let presenter = TeacherPaywallPresenter(view: view, router: router, interactor: interactor)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return factory(view)
    }
}
