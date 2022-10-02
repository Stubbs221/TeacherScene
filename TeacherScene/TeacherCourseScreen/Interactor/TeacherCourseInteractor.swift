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
    func interactorDidFetchData(with success: DataModelFB)
    func interactorDidFetchData(with failure: Error)
}

final class TeacherCourseInteractor: TeacherCourseInteractorInput {
    weak var output: TeacherCourseInteractorOutput? {
        didSet {
            self.fetchData()
        }
    }
    
    
    func fetchData() {
        #warning("тут подтягивай данные из файрбейс и кидай аргументом failure или success")
        
        let mockData: DataModelFB = createMockData()
        
//       switch result {
//        case .success(let success):
        output?.interactorDidFetchData(with: mockData)
//        case .failure(let error):
//        output?.interactorDidFetchData(with: error)
    }
    
    
    
    func createMockData() -> DataModelFB {
        #warning("удалить после добавления рабочей бизнес логики")
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let task1 = Task(taskNumber: 1, taskDescription: "Решите тесты по теме «Человек и общество»")
        let task2 = Task(taskNumber: 2, taskDescription: "Решите тесты по теме «Социальные отношения»")
        
        let event1 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-09-26 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event2 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-10-02 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event3 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-09-08 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event4 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-09-10 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event5 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-09-26 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event6 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-10-02 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event7 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-09-08 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        
        return DataModelFB(events: [event1, event2, event3, event4, event5, event6, event7])
        
    }
}


