//
//  TeacherCourseModuleBuilder.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

class TeacherCourseModuleBuilder {
    static func build(usingNavgationFactory factory: NavigationFactory) -> UIViewController {
        let view = TeacherCourseView()
        let interactor = TeacherCourseInteractor()
        let router = TeacherCourseRouter()
        let presenter = TeacherCoursePresenter(view: view, router: router, interactor: interactor)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return factory(view)
    }
}
