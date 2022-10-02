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
    func interactorDidFetchData(with success: DataModelFB) {
        var dataModelForView = DataModel(events: [])
        
        var dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for event in success.events {
            if let timeZone = TimeZone(abbreviation: "MSK") {
                let dateFromFB = event.eventDate
                let date = dateFormatter.string(from: changeToSystemTimeZone(dateFromFB, from: timeZone))
                let eventDate = String(
                    date[
                        date.index(date.startIndex, offsetBy: 6)...date.index(date.startIndex, offsetBy: 10)
                    ]
                )
                let eventTime = String(
                    date[
                        date.index(date.startIndex, offsetBy: 12)...date.index(date.startIndex, offsetBy: 16)
                    ]
                )
                
                
                
                dataModelForView.events.append(Event(eventName: event.eventName, eventDate: eventDate, eventTime: eventTime, haveRecordedBroadcast: event.haveRecordedBroadcast, homeTasks: event.homeTasks))
            }
        }
        
        view.updateDataSource(with: dataModelForView)
        
        #warning("добавить соортировку по дате через dateFormatter по eventDate")
        
        func changeToSystemTimeZone(_ date: Date, from: TimeZone, to: TimeZone = TimeZone.current) -> Date {
            let sourceOffset = from.secondsFromGMT(for: date)
            let destinationOffset = to.secondsFromGMT(for: date)
            let timeInterval = TimeInterval(destinationOffset - sourceOffset)
            return Date(timeInterval: timeInterval, since: date)
        }
    }
    
    func interactorDidFetchData(with failure: Error) {
        view.updateDataSource(with: failure)
    }
    
    
    
    
}

extension TeacherCoursePresenter: TeacherCourseViewOutput {
    
}
