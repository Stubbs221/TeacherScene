//
//  TeacherCourseInteractor.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit
//import Firebase
//import FirebaseStorage
//import FirebaseDatabase

protocol TeacherCourseInteractorInput {
    var output: TeacherCourseInteractorOutput? { get set }
    
    func fetchData()
    
    func addEventToCalendar(from event: Event)
}

protocol TeacherCourseInteractorOutput: AnyObject {
    func interactorDidFetchData(with success: DataModelFB)
    func interactorDidFetchData(with failure: Error)
}

final class TeacherCourseInteractor: TeacherCourseInteractorInput {
    func addEventToCalendar(from event: Event) {
        #warning("тут приходит событие для добавления в календарь и тут же вызывать метод класса EventManager")
        print("интерактор получил реквест о добавлении задачи в календарь")
    }
    
    weak var output: TeacherCourseInteractorOutput? {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.fetchData()
            })
            
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
        dateFormatter.dateFormat = "yyyy-dd/MM HH:mm:ss"
        
        let task1 = Task(taskNumber: 1, taskDescription: "Решите тесты по теме «Человек и общество»")
        let task2 = Task(taskNumber: 2, taskDescription: "Решите тесты по теме «Социальные отношения»")
        
        let event1 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-26/09 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event2 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-02/09 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event3 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-08/09 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event4 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-10/09 17:00:00")!, haveRecordedBroadcast: false, homeTasks: [task1, task2])
        let event5 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-26/09 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event6 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-02/10 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        let event7 = EventFB(eventName: "Человек и общество Социальные отношение ", eventDate: dateFormatter.date(from: "2022-02/09 17:00:00")!, haveRecordedBroadcast: true, homeTasks: [task1, task2])
        
        return DataModelFB(events: [event1, event2, event3, event4, event5, event6, event7])
        
    }
}


