//
//  TeacherCourseInteractor.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation

protocol TeacherCourseInteractorInput {
    var output: TeacherCourseInteractorOutput? { get set }
}

protocol TeacherCourseInteractorOutput: AnyObject {
    
}

final class TeacherCourseInteractor: TeacherCourseInteractorInput {
  weak var output: TeacherCourseInteractorOutput?
    
    
    
}


