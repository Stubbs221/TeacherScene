//
//  TeacherCourseTableViewCell + Actions.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.10.2022.
//

import Foundation
import UIKit

extension TeacherCourseTableViewCell {
    func setupUI() {

        self.backgroundColor = UIColor(named: "appBackgroundWhite")
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
//        контентвью исопльзуется для внешего фрейма ячейки и теней
        contentView.addSubview(eventView)
//        ивент вью служит внутренним фреймом, в котором включено свойство clipsToBounds, обрезающий весь контент его сабвью по границам вью
//        также с ним не работают тени, так что нужно использовать два вью - один для теней, второй для обрезки сабвью
        eventView.addSubview(lessonInfoView)
//        лессонИнфоВью служит контейнером для описания урока(события)
        lessonInfoView.addSubview(lessonImageView)
        lessonInfoView.addSubview(separatorForLessonInfoView)
        
        lessonInfoView.addSubview(dateLabel)
        lessonInfoView.addSubview(timeLabel)
        lessonInfoView.addSubview(descriptionLabel)
        lessonInfoView.addSubview(contentDescriptionLabel)
        contentView.addSubview(expandeCellButton)
        self.expandeCellButton.addTarget(self, action: #selector(expandCellButtonPressed(_:)), for: .touchUpInside)
        lessonInfoView.addSubview(estimatedTimeLabel)
        eventView.addSubview(taskNumberLabel1)
        eventView.addSubview(taskDescriptionLabel1)
        contentView.addSubview(openTaskButton1)
        self.openTaskButton1.addTarget(self, action: #selector(openTaskButton1Pressed), for: .touchUpInside)
        eventView.addSubview(taskNumberLabel2)
        eventView.addSubview(taskDescriptionLabel2)
        contentView.addSubview(openTaskButton2)
        self.openTaskButton2.addTarget(self, action: #selector(openTaskButton2Pressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            taskNumberLabel1.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: 22),
            taskNumberLabel1.topAnchor.constraint(equalTo: lessonInfoView.bottomAnchor, constant: 27)])
        
        NSLayoutConstraint.activate([
            taskDescriptionLabel1.leadingAnchor.constraint(equalTo: taskNumberLabel1.leadingAnchor),
            taskDescriptionLabel1.topAnchor.constraint(equalTo: taskNumberLabel1.bottomAnchor, constant: 10),
            taskDescriptionLabel1.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            openTaskButton1.leadingAnchor.constraint(equalTo: taskDescriptionLabel1.leadingAnchor),
            openTaskButton1.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -22),
            openTaskButton1.topAnchor.constraint(equalTo: taskDescriptionLabel1.bottomAnchor, constant: 14),
            openTaskButton1.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        NSLayoutConstraint.activate([
            taskNumberLabel2.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: 22),
            taskNumberLabel2.topAnchor.constraint(equalTo: openTaskButton1.bottomAnchor, constant: 27)])
        
        NSLayoutConstraint.activate([
            taskDescriptionLabel2.leadingAnchor.constraint(equalTo: taskNumberLabel2.leadingAnchor),
            taskDescriptionLabel2.topAnchor.constraint(equalTo: taskNumberLabel2.bottomAnchor, constant: 10),
            taskDescriptionLabel2.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            openTaskButton2.leadingAnchor.constraint(equalTo: taskDescriptionLabel2.leadingAnchor),
            openTaskButton2.trailingAnchor.constraint(equalTo: eventView.trailingAnchor, constant: -22),
            openTaskButton2.topAnchor.constraint(equalTo: taskDescriptionLabel2.bottomAnchor, constant: 14),
            openTaskButton2.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
            ])
        
        NSLayoutConstraint.activate([
            eventView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            eventView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            lessonInfoView.leadingAnchor.constraint(equalTo: eventView.leadingAnchor),
            lessonInfoView.trailingAnchor.constraint(equalTo: eventView.trailingAnchor),
            lessonInfoView.topAnchor.constraint(equalTo: eventView.topAnchor),
            lessonInfoView.heightAnchor.constraint(equalToConstant: 156)])
        
        NSLayoutConstraint.activate([
            lessonImageView.heightAnchor.constraint(equalTo: lessonInfoView.heightAnchor),
            lessonImageView.widthAnchor.constraint(equalTo: lessonImageView.heightAnchor),
            lessonImageView.widthAnchor.constraint(equalToConstant: 136),
            lessonImageView.leadingAnchor.constraint(equalTo: lessonInfoView.leadingAnchor),
            lessonImageView.topAnchor.constraint(equalTo: lessonInfoView.topAnchor)])
        
        NSLayoutConstraint.activate([
            separatorForLessonInfoView.leadingAnchor.constraint(equalTo: lessonImageView.trailingAnchor),
            separatorForLessonInfoView.heightAnchor.constraint(equalTo: lessonImageView.heightAnchor)])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: lessonImageView.trailingAnchor, constant: eventViewPadding),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: lessonInfoView.trailingAnchor, constant: -eventViewPadding),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: lessonInfoView.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            contentDescriptionLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            contentDescriptionLabel.bottomAnchor.constraint(equalTo: lessonInfoView.bottomAnchor, constant: -17)])
        
        NSLayoutConstraint.activate([
            expandeCellButton.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            expandeCellButton.bottomAnchor.constraint(equalTo: contentDescriptionLabel.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            estimatedTimeLabel.trailingAnchor.constraint(equalTo: expandeCellButton.leadingAnchor, constant: -8),
            estimatedTimeLabel.bottomAnchor.constraint(equalTo: contentDescriptionLabel.bottomAnchor)
        ])
        
        
    }
    
    override func prepareForReuse() {
        self.isCellSecelted = false
        self.expandeCellButton.imageView?.transform = CGAffineTransform.identity
    }
    
    
    func configureCell(with data: Event) {
        
        self.dateLabel.text = data.eventDate
        self.timeLabel.text = data.eventTime
        self.descriptionLabel.text = data.eventName
        self.contentDescriptionLabel.text = data.haveRecordedBroadcast ? "Запись видео" : "Трансляция"
        self.lessonInfoView.backgroundColor = data.haveRecordedBroadcast ? UIColor(named: "appVioletColor") : UIColor.white
        self.separatorForLessonInfoView.isHidden = data.haveRecordedBroadcast
        self.dateLabel.textColor = data.haveRecordedBroadcast ? UIColor.white : UIColor.black
        self.timeLabel.textColor = data.haveRecordedBroadcast ? UIColor.white : UIColor.black
        self.descriptionLabel.textColor = data.haveRecordedBroadcast ? UIColor.white : UIColor.black
        self.estimatedTimeLabel.text = "≈ 50 мин"
        self.contentDescriptionLabel.textColor = data.haveRecordedBroadcast ? UIColor.white : UIColor(named: "appVioletColor")
        self.estimatedTimeLabel.textColor = data.haveRecordedBroadcast ? UIColor.white : UIColor.systemGray3
        self.expandeCellButton.setImage(UIImage(named: data.haveRecordedBroadcast ? "arrowWhite" : "arrowBlack"), for: .normal)
        self.taskDescriptionLabel1.text = data.homeTasks[0].taskDescription
        self.taskDescriptionLabel2.text = data.homeTasks[1].taskDescription
        
        self.openTaskButton1.isHidden = !data.isCellSelected
        self.openTaskButton2.isHidden = !data.isCellSelected
        self.openTaskButton1.isEnabled = data.isCellSelected
        self.openTaskButton2.isEnabled = data.isCellSelected
        
        if data.isCellSelected == true {
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseIn) {
                self.expandeCellButton.imageView?.transform = CGAffineTransform(rotationAngle: -.pi)
            }
        }
    }


    
    
    @objc func expandCellButtonPressed(_ sender: UIButton) {
        print("pressed button with index \(String(describing: self.index))")
        if let delegate = delegate,
            let index = index{
            
            delegate.teacherCourseTableViewCell(self, expandButtonTappedFor: index)
        }
    }
    
    @objc func openTaskButton1Pressed() {
        print("task1 button pressed")
        self.delegate?.taskButtonTappedFor(cell: self.index!, taskIndex: 0)
    }
    
    @objc func openTaskButton2Pressed() {
        print("task2 button pressed")
        self.delegate?.taskButtonTappedFor(cell: self.index!, taskIndex: 1)
    }
}
