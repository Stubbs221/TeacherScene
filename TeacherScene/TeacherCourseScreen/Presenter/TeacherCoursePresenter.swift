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

    func presenterConvertRawData(with data: DataModel)
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
        
        
        #warning("после инициализации зависимостей презентера мы вызываем метод сетевого слоя на подтягивание данных с дб")
//        self.interactor.fetchData()
        
    }
}

extension TeacherCoursePresenter: TeacherCourseInteractorOutput {
    func interactorDidFetchData(with success: DataModel) {
        view.updateDataSource(with: success)
    }
    
    func interactorDidFetchData(with failure: Error) {
        view.updateDataSource(with: failure)
    }
    
    
    
    
}

extension TeacherCoursePresenter: TeacherCourseViewOutput {
    
}
