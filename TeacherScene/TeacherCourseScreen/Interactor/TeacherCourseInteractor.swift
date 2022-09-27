//
//  TeacherCourseInteractor.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

protocol TeacherCourseInteractorInput {
    var output: TeacherCourseInteractorOutput? { get set }
    
    func fetchData()
}

protocol TeacherCourseInteractorOutput: AnyObject {
    func interactorDidFetchDataFromDB(with result: Result<DataModel, Error>)
}

final class TeacherCourseInteractor: TeacherCourseInteractorInput {
    weak var output: TeacherCourseInteractorOutput?
    
    
    func fetchData() {
        #warning("тут подтягивай данные из файрбейс и кидай аргументом ")
        
        let mockData: DataModel = createMockData()
        
//       switch result {
//        case .success:
        output?.interactorDidFetchDataFromDB(with: .success(mockData))
//        case .failure(let error):
//        output?.interactorDidFetchDataFromDB(with: .failure(error))
    }
    
    
    
    func createMockData() -> DataModel {
        #warning("удалить после добавления рабочей бизнес логики")
        let task1 = Task(taskDescription: "Решите тесты по теме «Человек и общество»")
        let task2 = Task(taskDescription: "Решите тесты по теме «Социальные отношения»")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        
        let event1 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "26/09 17:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event2 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "02/09 17:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event3 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "08/09 17:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event4 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "10/09 17:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event5 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "26/09 17:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event6 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "02/09 17:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event7 = Event(eventName: "Человек и общество Социальные отношение ", eventDate: formatter.date(from: "08/09 17:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        
        return DataModel(events: [event1, event2, event3, event4, event5, event6, event7])
        
    }
}


