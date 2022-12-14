//
//  TeacherCourseRouter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation
import UIKit

protocol TeacherCourseRouterInput {
    func showModule(with view: UIViewController)
    
    func showContactWithTelegram()
    
    func showTaskModule(with task: Task)
    
    func showEventMedia(from task: Event)
}

final class TeacherCourseRouter: TeacherCourseRouterInput {
    
    
    
    weak var rootViewController: UIViewController?
    
    func showEventMedia(from task: Event) {
        print("роутер получил запрос на открытие трансляции/записи от пользователя")
    }
    
    func showModule(with view: UIViewController) {
        print("router did receive action")
    }
    
    func showContactWithTelegram() {
        #warning("тут открывается телега")
        print("нажата кнопка открытия телеграма")
    }
    
    func showTaskModule(with task: Task) {
        #warning("тут открывается задание урока")
        print("нажата кнопка открытия задания урока")
    }
}
