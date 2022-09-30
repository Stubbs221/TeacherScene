//
//  TeacherCourseTableViewCell.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit

class TeacherCourseTableViewCell: UITableViewCell, UIScrollViewDelegate {

    static let reuseIdentifier = "TeacherCourseCell"
    
    private var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    private var eventView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private var lessonInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.2
//        view.clipsToBounds = true
        
        return view
    }()
    
    private var lessonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taskMockImage")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var separatorForLessonInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private var contentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var estimatedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var expandeCellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 15).isActive = true
        button.widthAnchor.constraint(equalToConstant: 15).isActive = true
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(expandCellButtonPressed), for: .touchUpInside)
        return button
    }()
    
//  MARK: Вью с заданием
    
    
    private var taskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        return view
    }()
    
    
    
    
    
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
//        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        contentView.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.layer.cornerRadius = 18
//        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(named: "appBackgroundWhite")
        contentView.addSubview(baseView)
        
        baseView.addSubview(eventView)
        eventView.addSubview(lessonInfoView)
        
        lessonInfoView.addSubview(lessonImageView)
        lessonInfoView.addSubview(separatorForLessonInfoView)
        
        lessonInfoView.addSubview(dateLabel)
        lessonInfoView.addSubview(timeLabel)
        lessonInfoView.addSubview(descriptionLabel)
        lessonInfoView.addSubview(contentDescriptionLabel)
        lessonInfoView.addSubview(expandeCellButton)
        lessonInfoView.addSubview(estimatedTimeLabel)
        
        NSLayoutConstraint.activate([
            baseView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7)
            ])
        
        NSLayoutConstraint.activate([
            eventView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            eventView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            eventView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7)
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
            dateLabel.leadingAnchor.constraint(equalTo: lessonImageView.trailingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: lessonInfoView.topAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: lessonInfoView.trailingAnchor, constant: -20),
            timeLabel.topAnchor.constraint(equalTo: lessonInfoView.topAnchor, constant: 16)])
        
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
        
//        конфигурируем блок с заданиями
        let taskViews = configureTasksContentView(from: data.homeTasks)
        eventView.addSubview(taskViews)
        NSLayoutConstraint.activate([
            taskViews.leadingAnchor.constraint(equalTo: lessonInfoView.leadingAnchor),
            taskViews.trailingAnchor.constraint(equalTo: lessonInfoView.trailingAnchor),
            taskViews.topAnchor.constraint(equalTo: lessonInfoView.bottomAnchor)
            ])
        
        
    }

    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.contentView.layoutIfNeeded()
        }
    }
    
    

    func configureTasksContentView(from tasks: [Task]) -> UIView {
//        родительское вью для задач
        var view = UIView()
        
        
        switch tasks.count {
        case 0:
            view = configureTasksContentViewWithZeroElements()
        case ..<3:
            view = configureTasksContentViewWithLessThan3(elements: tasks)
        case 3...:
            view = configureTasksContentViewWithMoreThan2(elements: tasks)
        default:
            print(tasks.count)
            fatalError()
        }
        return view
    }
    
    private func configureTasksContentViewWithZeroElements() -> UIView {
//        если задач для урока нет
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        var descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Этот урок не включает в себя задания"
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            return label
        }()
        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }
    
    private func configureTasksContentViewWithLessThan3(elements: [Task]) -> UIView {
//        если задач для урока < 3
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: CGFloat(175 * elements.count)).isActive = true
        
        for (i, element) in elements.enumerated() {
            view.addSubview(configureTaskView(from: element))
            view.subviews[i].topAnchor.constraint(equalTo: i == 0 ? view.topAnchor : view.subviews[i - 1].bottomAnchor).isActive = true
        }
        return view
    }
    
    private func configureTasksContentViewWithMoreThan2(elements: [Task]) -> UIView {
//        если задач для урока  > 2
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        
        var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.delegate = self
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            
            
//            scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }()
        
        var contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
            view.widthAnchor.constraint(equalToConstant: 1000).isActive = true
            return view
        }()
        
        var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.axis = .vertical
            stackView.spacing = -50
            return stackView
        }()
        
        for element in elements {
            let taskView = configureTaskView(from: element)
//            taskView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//            taskView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            stackView.addArrangedSubview(taskView)
            
        }
        
        scrollView.contentSize = CGSize(width: 1000, height: 1000)
        
        view.addSubview(scrollView)
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.contentSize = stackView.frame.size
        
        scrollView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(175 * elements.count)).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.backgroundColor = .blue
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true

        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        return view
    }
    
    func configureTaskView(from task: Task) -> UIView {
//
        #warning("уточнить в каком виде должны быть представлены задачи")
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        
        view.backgroundColor = .cyan
        let taskNumberLabel = makeTaskNumberLabel(with: task.taskNumber)
        let taskDescriptionLabel = makeTaskDescriotionLabel(with: task.taskDescription)
        let openTaskButton = makeOpenTaskButton()
        
        view.addSubview(taskNumberLabel)
        view.addSubview(taskDescriptionLabel)
        view.addSubview(openTaskButton)
        
        NSLayoutConstraint.activate([
            taskNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            taskNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 33)])
        
        NSLayoutConstraint.activate([
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: taskNumberLabel.leadingAnchor),
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskNumberLabel.bottomAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            openTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openTaskButton.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor, constant: 14)
        ])
        
        return view
    }
    
    private func makeTaskNumberLabel(with number: Int) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.text = "Задание " + String(number)
        label.textColor = UIColor(named: "appVioletColor")
        return label
    }
    
    private func makeTaskDescriotionLabel(with description: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }
    
    private func makeOpenTaskButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "appVioletColor")
        button.setTitle("Выполнить задание", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        return button
    }
    
    @objc func expandCellButtonPressed() {
        #warning("чо тут делоть тооо")
    }
}
