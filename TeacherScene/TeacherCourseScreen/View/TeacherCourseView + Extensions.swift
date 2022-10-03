//
//  TeacherCourseView + TableView Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit

extension TeacherCourseView: ContactTelegramTableViewHeaderDelegate {
    func contactWithTelegramButton() {
        self.output?.contactWithTelegramButtonTapped()
    }
    
    
}

extension TeacherCourseView: TeacherCourseTableViewCellDelegate {
    func taskButtonTappedFor(cell indexPath: IndexPath, taskIndex: Int) {
        output?.userTappedOpenTaskButton(for: (self.dataModel?.events[indexPath.row].homeTasks[taskIndex])!)
    }
    
    func teacherCourseTableViewCell(_ teacherCourseTableViewCell: TeacherCourseTableViewCell, expandButtonTappedFor index: IndexPath) {
        defer {
            teacherCourseTableView.scrollToRow(at: index, at: .top, animated: true)
        }

        print("Cell indexPath is: \(index)")
        guard let selectedIndex = selectedIndex else {
            self.selectedIndex = index
            teacherCourseTableView.beginUpdates()
//                teacherCourseTableViewCell.expandeCellButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
//            teacherCourseTableViewCell.openTaskButton1.isHidden = false
//            teacherCourseTableViewCell.openTaskButton2.isHidden = false
//            teacherCourseTableViewCell.openTaskButton1.isEnabled = true
//            teacherCourseTableViewCell.openTaskButton2.isEnabled = true
            teacherCourseTableView.endUpdates()
//            print("Selected indexPath is: \(String(describing: selectedIndex)), cell index is \(String(describing: teacherCourseTableViewCell.index))")
            return
        }


        if self.selectedIndex == index {
            self.selectedIndex = nil

            teacherCourseTableView.beginUpdates()
//            UIView.animate(withDuration: 0.25) {
//                teacherCourseTableViewCell.expandeCellButton.imageView?.transform = .identity
//            }
            teacherCourseTableView.reloadRows(at: [], with: .none)
//            teacherCourseTableViewCell.openTaskButton1.isHidden = true
//            teacherCourseTableViewCell.openTaskButton2.isHidden = true
//            teacherCourseTableViewCell.openTaskButton1.isEnabled = false
//            teacherCourseTableViewCell.openTaskButton2.isEnabled = false
            teacherCourseTableView.endUpdates()
//            print("Selected indexPath is: \(selectedIndex), cell index is \(String(describing: teacherCourseTableViewCell.index))")
        } else {
            self.selectedIndex = index
            teacherCourseTableView.beginUpdates()
            
//                teacherCourseTableViewCell.expandeCellButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
//            teacherCourseTableViewCell.openTaskButton1.isHidden = false
//            teacherCourseTableViewCell.openTaskButton2.isHidden = false
//            teacherCourseTableViewCell.openTaskButton1.isEnabled = true
//            teacherCourseTableViewCell.openTaskButton2.isEnabled = true
            teacherCourseTableView.endUpdates()
//            print("Selected indexPath is: \(selectedIndex)")
        }
    }


}

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let dataModel = self.dataModel else { return 0 }
        
        return section == 0 ? 1 : dataModel.events.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeacherCourseTableViewCell.reuseIdentifier, for: indexPath) as? TeacherCourseTableViewCell,
              let dataModel = dataModel else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureCell(with: dataModel.events[indexPath.row])
        cell.delegate = self
        cell.index = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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

