//
//  DataModelFromFB.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 02.10.2022.
//

import Foundation

struct DataModelFB {
    var events: [EventFB]
}

struct EventFB {
    
    var eventName: String
    var eventDate: Date
    var haveRecordedBroadcast: Bool
    var homeTasks: [Task]
    var isOpened: Bool = false
}


