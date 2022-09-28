//
//  TeacherCourseView + TableView Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit

extension TeacherCourseView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.dataModel?.events.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        self.dataModel?.events.count ?? 0
        guard let section = self.dataModel?.events[section] else { return 0 }
        
        if section.isOpened {
            return section.homeTasks.count + 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath) as? TeacherCourseTableViewCell else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = dataModel?.events[indexPath.section].eventName
            
            cell.backgroundColor = .systemBlue
        } else {
            cell.textLabel?.text = dataModel?.events[indexPath.section].homeTasks[indexPath.row - 1].taskDescription
            cell.backgroundColor = .cyan
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard let dataModel = dataModel else { return }
        guard let state = dataModel?.events[indexPath.section].isOpened else { return }
        
        
        if indexPath.row == 0 {
            dataModel?.events[indexPath.section].isOpened = !state
//            UIView.animate(withDuration: 1, delay: 0.0) {
//                tableView.reloadSections([indexPath.section], with: .none)
            tableView.reloadSections([indexPath.row], with: .none)
//            }
            
        } else {
            print("tapped sub cell")
        }
        
        
    }
}

