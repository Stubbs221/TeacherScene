//
//  TeacherPaywallInteractor.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation

protocol TeacherPaywallInteractorInput {
    var output: TeacherPaywallInteractorOutput? { get set }
}

protocol TeacherPaywallInteractorOutput: AnyObject {
    
}

final class TeacherPaywallInteractor: TeacherPaywallInteractorInput {
   
    weak var output: TeacherPaywallInteractorOutput?
    
    
}
