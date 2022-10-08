//
//  DataModel.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import Foundation

struct DataModel {
    var events: [Event]
}

struct Event {
    
    var eventName: String
    var eventDate: String
    var eventTime: String
    var haveRecordedBroadcast: Bool
    var homeTasks: [Task]
    var isCellSelected: Bool = false
}

struct Task {
    var taskNumber: Int
    var taskDescription: String
}
