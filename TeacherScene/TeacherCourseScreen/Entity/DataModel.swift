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
    var eventDate: Date
    var haveRecordedBroadcast: Bool
    var homeTasks: [Task]
    var isOpened: Bool = false
}

struct Task {
    var taskDescription: String
}
