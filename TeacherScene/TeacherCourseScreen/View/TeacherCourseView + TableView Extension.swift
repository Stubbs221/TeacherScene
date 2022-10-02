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
            return 540
        }
        return rowHeight
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2

    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Ближайшая трансляция"
//        case 1:
//            return "Учебный план"
//        default:
//            return ""
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let dataModel = self.dataModel else { return 0 }
        return dataModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath) as? TeacherCourseTableViewCell,
              let dataModel = dataModel else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(with: dataModel.events[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        defer {
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
       
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
          
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TeacherCourseTableViewSectionHeader.reuseIdentifier) as? TeacherCourseTableViewSectionHeader else { return nil }
        header.configureSectionHeader(with: self.sections[section])
        return header
    }
//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    
}

