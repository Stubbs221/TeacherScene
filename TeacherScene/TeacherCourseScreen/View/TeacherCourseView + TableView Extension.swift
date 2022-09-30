//
//  TeacherCourseView + TableView Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit

extension TeacherCourseView: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 170
        guard let dataModel = dataModel else { return rowHeight }
        if selectedIndex == indexPath {
            switch dataModel.events[indexPath.row].homeTasks.count {
            case ..<3:
                return rowHeight + CGFloat(175 * (dataModel.events[indexPath.row].homeTasks.count))
            case 3...:
                return rowHeight + 350
            default:
                return 175
            }
            
        }
        return rowHeight
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
//        self.dataModel?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        self.dataModel?.events.count ?? 0
        guard let dataModel = self.dataModel else { return 0 }
        return dataModel.events.count
//        guard let section = self.dataModel?.events[section] else { return 0 }
//
//        if section.isOpened {
//            return section.homeTasks.count + 1
//        }
//        else {
//            return 1
//        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath) as? TeacherCourseTableViewCell,
              let dataModel = dataModel else { return UITableViewCell() }
//        let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath)
        
        cell.selectionStyle = .none
        cell.configureCell(with: dataModel.events[indexPath.row])
        
//        if indexPath.row == 0 {
//            cell.textLabel?.text = dataModel?.events[indexPath.section].eventName
//
//            cell.backgroundColor = .systemBlue
//        } else {
//            cell.textLabel?.text = dataModel?.events[indexPath.section].homeTasks[indexPath.row - 1].taskDescription
//            cell.backgroundColor = .cyan
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        defer {
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
//        guard let dataModel = dataModel else { return }
//        guard let state = dataModel?.events[indexPath.section].isOpened else { return }
        
        guard let selectedIndex = selectedIndex else {
            selectedIndex = indexPath
            tableView.beginUpdates()
            tableView.reloadRows(at: [selectedIndex!], with: .none)
            tableView.endUpdates()
            return
        }
        
        
        if self.selectedIndex == indexPath {
            self.selectedIndex = nil
            
            tableView.beginUpdates()
            tableView.reloadRows(at: [], with: .none)
            tableView.endUpdates()
        } else {
            self.selectedIndex = indexPath
            tableView.beginUpdates()
            tableView.reloadRows(at: [self.selectedIndex!], with: .none)
            tableView.endUpdates()
        }
        
//        if indexPath.row == 0 {
//            dataModel?.events[indexPath.section].isOpened = !state
//            tableView.beginUpdates()
//            tableView.reloadSections([indexPath.section], with: .none)
//            tableView.endUpdates()
//            
//        } else {
//            print("tapped sub cell")
//        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ContactTelegramTableViewHeader.reuseIdentifier) as? ContactTelegramTableViewHeader else { return nil }
        header.configure(with: "Телеграм-чат для связи с преподавателем ")
        return header
    }
//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        140
    }
    
    
}

