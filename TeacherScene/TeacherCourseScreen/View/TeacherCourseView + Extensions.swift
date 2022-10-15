//
//  TeacherCourseView + TableView Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit
//import SkeletonView

extension TeacherCourseView: ContactTelegramTableViewHeaderDelegate {
    func contactWithTelegramButton() {
        self.output?.contactWithTelegramButtonTapped()
    }
}

extension TeacherCourseView: TeacherCourseTableViewCellDelegate {
    
    func changeIsSelectedCellState(with indexPath: IndexPath, state: Bool) {
        if indexPath.section == 0 {
            self.dataModel?.nextEvent?.isCellSelected = state
        } else {
            self.dataModel?.events[indexPath.row].isCellSelected = state
        }
    }
    
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
            changeIsSelectedCellState(with: selectedIndex!, state: true)
            
            teacherCourseTableView.beginUpdates()
            
//            UIView.animate(withDuration: 0.25, delay: 0.1) {
//                cell.expandeCellButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            }
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
            teacherCourseTableView.endUpdates()
            return
        }

        if self.selectedIndex == index {
//            срабатывает если повторно попытаться открыть одну и туже ячейку( должна скрыться)
//            индексу выбранной ячейки присваивается нил, так как активная ячейка должна скрыться
            changeIsSelectedCellState(with: selectedIndex, state: false)
            self.selectedIndex = nil
            
            teacherCourseTableView.beginUpdates()
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseOut) {
                
                teacherCourseTableViewCell.expandeCellButton.imageView?.transform = CGAffineTransform.identity
//
            }
            teacherCourseTableView.reloadRows(at: [], with: .none)
            teacherCourseTableView.endUpdates()
        } else {
//            срабатывает в случае если уже была открыта одна ячейка и пользователь открыл другую
//            первой присваиваем стейт "ячейка выбрана" - false
            changeIsSelectedCellState(with: self.selectedIndex!, state: false)
            teacherCourseTableView.beginUpdates()
//            UIView.animate(withDuration: 0.25, delay: 0.1) {
//                let cell = self.teacherCourseTableView.cellForRow(at: self.selectedIndex!) as! TeacherCourseTableViewCell
//                cell.expandeCellButton.imageView?.transform = CGAffineTransform.identity
//            }
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
            teacherCourseTableView.endUpdates()
            
            self.selectedIndex = index
            
//            второй присваиваем стейт "ячейка выбрана" - true
            changeIsSelectedCellState(with: self.selectedIndex!, state: true)
            
            teacherCourseTableView.beginUpdates()
//            UIView.animate(withDuration: 0.25, delay: 0.1) {
//                let cell = self.teacherCourseTableView.cellForRow(at: self.selectedIndex!) as! TeacherCourseTableViewCell
//                cell.expandeCellButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            }
            teacherCourseTableView.reloadRows(at: [self.selectedIndex!], with: .none)
            teacherCourseTableView.endUpdates()
        }
    }

    
}

extension TeacherCourseView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: indexPath as NSCopying,
            previewProvider: nil) { _ in
                
                let saveToCalendar = UIAction(title: "Сохранить в календарь", image: UIImage(systemName: "calendar.badge.plus"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    guard let dataModel = self.dataModel else { return }
                    self.output?.userSelectedAddEventToCalendat(with: indexPath, dataModel: dataModel)

                }
                
                let openBroadcast = UIAction(title: "Открыть трансляцию", image: UIImage(systemName: "film"), identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    guard let dataModel = self.dataModel else { return }
                    self.output?.userTappedCell(with: indexPath, dataModel: dataModel)
                }
                
                return UIMenu(title: "",
                              image: nil,
                              identifier: nil,
                              options: UIMenu.Options.displayInline,
                              children: [saveToCalendar, openBroadcast])
            }
        
        return config
    }
    
    func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return makeTagretedPreview(for: configuration)
    }
    
    func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return makeTagretedPreview(for: configuration)
    }
    
    private func makeTagretedPreview(for configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let indexPath = configuration.identifier as? IndexPath else { return nil }
        guard let cell = teacherCourseTableView.cellForRow(at: indexPath) as? TeacherCourseTableViewCell else { return nil }
        let parameters = UIPreviewParameters()
        parameters.backgroundColor = .clear
        parameters.visiblePath = UIBezierPath(roundedRect: cell.lessonInfoView.bounds, cornerRadius: 20)
        
        return UITargetedPreview(view: cell.lessonInfoView, parameters: parameters)
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

        if indexPath.section ==  0 {
            cell.configureCell(with: dataModel.nextEvent ?? dataModel.events[indexPath.row])
        } else {
            cell.configureCell(with: dataModel.events[indexPath.row]) }
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let dataModel = dataModel else { return }
        output?.userTappedCell(with: indexPath, dataModel: dataModel)
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

