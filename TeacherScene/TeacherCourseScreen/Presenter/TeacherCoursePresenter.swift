//
//  TeacherCoursePresenter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation

protocol TeacherCoursePresenterInput {
    var output: TeacherCoursePresenterOutput? { get set }
}

protocol TeacherCoursePresenterOutput: AnyObject {
    
}

class TeacherCoursePresenter {
    
    weak var output: TeacherCoursePresenterOutput?
    
    private var interactor: TeacherCourseInteractorInput
    private var router: TeacherCourseRouterInput
    private var view: TeacherCourseViewInput
    
    init(view: TeacherCourseViewInput,
         router: TeacherCourseRouterInput,
         interactor: TeacherCourseInteractorInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TeacherCoursePresenter: TeacherCourseInteractorOutput {
    
}

extension TeacherCoursePresenter: TeacherCourseViewOutput {
    
}