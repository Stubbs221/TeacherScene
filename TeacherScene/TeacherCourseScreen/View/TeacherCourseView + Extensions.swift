//
//  TeacherCourseView + TableView Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit
import SkeletonView

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
        

        guard let selectedIndex = selectedIndex else {
//            срабатывает если никакая ячейка до этого не была выбрана
            self.selectedIndex = index
            
//            меняется стейт "ячейка открыта/закрыта" в моделе данных для вьюхи
            self.dataModel?.events[selectedIndex!.row].isCellSelected = true
            
//            teacherCourseTableView.performBatchUpdates {
//                if !teacherCourseTableViewCell.isCellSecelted {
//                    teacherCourseTableViewCell.dealWithTasks() }
//                teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
//            }

            teacherCourseTableView.beginUpdates()
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
            teacherCourseTableView.endUpdates()
            return
        }
        
        
//
        if self.selectedIndex == index {
//            срабатывает если повторно попытаться открыть одну и туже ячейку( должна скрыться)
//            индексу выбранной ячейки присваивается нил, так как активная ячейка должна скрыться
            
            self.dataModel?.events[selectedIndex.row].isCellSelected = false
            self.selectedIndex = nil
            
            
            
//            teacherCourseTableView.performBatchUpdates {
//                if teacherCourseTableViewCell.isCellSecelted {
//                    teacherCourseTableViewCell.dealWithTasks() }
            teacherCourseTableView.beginUpdates()
                teacherCourseTableView.reloadRows(at: [], with: .none)
            teacherCourseTableView.endUpdates()
//            }

        } else {
//            срабатывает в случае если уже была открыта одна ячейка и пользователь открыл другую
            
//            первой присваиваем стейт "ячейка выбрана" - false
            self.dataModel?.events[selectedIndex.row].isCellSelected = false
            
            
            self.selectedIndex = index
            
//            второй присваиваем стейт "ячейка выбрана" - true
            self.dataModel?.events[selectedIndex.row].isCellSelected = true
            
            teacherCourseTableView.performBatchUpdates {
//                if !teacherCourseTableViewCell.isCellSecelted {
//                    teacherCourseTableViewCell.dealWithTasks() }
                
            }
            
            teacherCourseTableView.beginUpdates()
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
            teacherCourseTableView.endUpdates()
        }
    }


}

extension TeacherCourseView: SkeletonTableViewDelegate, SkeletonTableViewDataSource {
 
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return TeacherCourseTableViewCell.reuseIdentifier
    }
    
    
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
        cell.delegate = self
        cell.index = indexPath
        
        
        cell.configureCell(with: dataModel.events[indexPath.row])
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

