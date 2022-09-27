//
//  TeacherPaywallPresenter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation

protocol TeacherPaywallPresenterInput {
    var output: TeacherPaywallPresenterOutput? { get set }
}

protocol TeacherPaywallPresenterOutput: AnyObject {
    
}

class TeacherPaywallPresenter {
    
    weak var output: TeacherPaywallPresenterOutput?
    
    private var interactor: TeacherPaywallInteractorInput
    private var router: TeacherPaywallRouterInput
    private var view: TeacherPaywallViewInput
    
    init(view: TeacherPaywallViewInput,
         router: TeacherPaywallRouterInput,
         interactor: TeacherPaywallInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension TeacherPaywallPresenter: TeacherPaywallViewOutput {
    
}

extension TeacherPaywallPresenter: TeacherPaywallInteractorOutput {
    
    
}
