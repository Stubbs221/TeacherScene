//
//  TeacherCourseTableViewCell.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit

protocol TeacherCourseTableViewCellDelegate: AnyObject {
    func teacherCourseTableViewCell(_ teacherCourseTableViewCell: TeacherCourseTableViewCell, expandButtonTappedFor index: IndexPath)
    
    func taskButtonTappedFor(cell indexPath: IndexPath, taskIndex: Int)
}

class TeacherCourseTableViewCell: UITableViewCell, UIScrollViewDelegate {

    static let reuseIdentifier = "TeacherCourseCell"
    
    var index: IndexPath?
    
    weak var delegate: TeacherCourseTableViewCellDelegate?
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var eventView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var lessonInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.2
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var lessonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taskMockImage")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var separatorForLessonInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var contentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var estimatedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var expandeCellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 15).isActive = true
        button.widthAnchor.constraint(equalToConstant: 15).isActive = true
        button.imageView?.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = true
        button.imageView?.isUserInteractionEnabled = true
        return button
    }()
    
//  MARK: Вью с заданием
    
    
    lazy var taskView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 32).isActive = true
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var taskNumberLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.text = "Задание 1"
        label.textColor = UIColor(named: "appVioletColor")
        return label
    }()
    
    lazy var taskDescriptionLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    #warning("этот баттн не обрабатывается")
    lazy var openTaskButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "appVioletColor")
        button.setTitle("Выполнить задание", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.isUserInteractionEnabled = true
//        button.isHidden = true
//        button.isEnabled = false
        return button
    }()
    
    lazy var taskView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 175).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 32).isActive = true
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var taskNumberLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.text = "Задание 2"
        label.textColor = UIColor(named: "appVioletColor")
        return label
    }()
    
    lazy var taskDescriptionLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
#warning(" и этот баттн не обрабатывается")
    lazy var openTaskButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "appVioletColor")
        button.setTitle("Выполнить задание", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.isUserInteractionEnabled = true
        button.isHighlighted = true
//        button.isSelected = true
//        button.isHidden = true
//        button.isEnabled = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.contentView.isUserInteractionEnabled = false
//        self.isUserInteractionEnabled = false
        setupUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setupUI() {

        contentView.backgroundColor = UIColor(named: "appBackgroundWhite")
        contentView.addSubview(baseView)
        
        
        baseView.addSubview(eventView)
        eventView.addSubview(lessonInfoView)
        eventView.addSubview(taskView1)
        eventView.addSubview(taskView2)
        
        taskView1.addSubview(taskNumberLabel1)
        taskView1.addSubview(taskDescriptionLabel1)
        taskView1.addSubview(openTaskButton1)
        #warning("тут ставится им экшн")
        self.openTaskButton1.addTarget(taskView1, action: #selector(openTaskButton1Pressed), for: .touchUpInside)
        
        taskView2.addSubview(taskNumberLabel2)
        taskView2.addSubview(taskDescriptionLabel2)
        taskView2.addSubview(openTaskButton2)
        self.openTaskButton1.addTarget(taskView2, action: #selector(openTaskButton2Pressed), for: .touchUpInside)
        
        lessonInfoView.addSubview(lessonImageView)
        lessonInfoView.addSubview(separatorForLessonInfoView)
        
        lessonInfoView.addSubview(dateLabel)
        lessonInfoView.addSubview(timeLabel)
        lessonInfoView.addSubview(descriptionLabel)
        lessonInfoView.addSubview(contentDescriptionLabel)
        lessonInfoView.addSubview(expandeCellButton)
        self.expandeCellButton.addTarget(self, action: #selector(expandCellButtonPressed(_:)), for: .touchUpInside)
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
        
        NSLayoutConstraint.activate([
            taskView1.centerXAnchor.constraint(equalTo: eventView.centerXAnchor),
            taskView1.topAnchor.constraint(equalTo: lessonInfoView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            taskNumberLabel1.leadingAnchor.constraint(equalTo: taskView1.leadingAnchor, constant: 22),
            taskNumberLabel1.topAnchor.constraint(equalTo: taskView1.topAnchor, constant: 27)])
        
        NSLayoutConstraint.activate([
            taskDescriptionLabel1.leadingAnchor.constraint(equalTo: taskNumberLabel1.leadingAnchor),
            taskDescriptionLabel1.topAnchor.constraint(equalTo: taskNumberLabel1.bottomAnchor, constant: 10),
            taskDescriptionLabel1.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            openTaskButton1.leadingAnchor.constraint(equalTo: taskDescriptionLabel1.leadingAnchor),
            openTaskButton1.trailingAnchor.constraint(equalTo: taskView1.trailingAnchor, constant: -22),
            openTaskButton1.bottomAnchor.constraint(equalTo: taskView1.bottomAnchor, constant: -14),
            openTaskButton1.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        NSLayoutConstraint.activate([
            taskView2.centerXAnchor.constraint(equalTo: eventView.centerXAnchor),
            taskView2.topAnchor.constraint(equalTo: taskView1.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            taskNumberLabel2.leadingAnchor.constraint(equalTo: taskView2.leadingAnchor, constant: 22),
            taskNumberLabel2.topAnchor.constraint(equalTo: taskView2.topAnchor, constant: 27)])
        
        NSLayoutConstraint.activate([
            taskDescriptionLabel2.leadingAnchor.constraint(equalTo: taskNumberLabel2.leadingAnchor),
            taskDescriptionLabel2.topAnchor.constraint(equalTo: taskNumberLabel2.bottomAnchor, constant: 10),
            taskDescriptionLabel2.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            openTaskButton2.leadingAnchor.constraint(equalTo: taskDescriptionLabel2.leadingAnchor),
            openTaskButton2.trailingAnchor.constraint(equalTo: taskView2.trailingAnchor, constant: -22),
            openTaskButton2.bottomAnchor.constraint(equalTo: taskView2.bottomAnchor, constant: -14),
            openTaskButton2.heightAnchor.constraint(equalToConstant: 47)
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
//        self.expandeCellButton.addTarget(self, action: #selector(expandCellButtonPressed(_:)), for: .touchUpInside)
        
        self.taskDescriptionLabel1.text = data.homeTasks[0].taskDescription
        self.taskDescriptionLabel2.text = data.homeTasks[1].taskDescription
    }

    func animate() {
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.contentView.layoutIfNeeded()
        }
    }

    @objc func expandCellButtonPressed(_ sender: UIButton) {
//        sender.imageView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        print("pressed button with index \(String(describing: self.index))")
        if let delegate = delegate,
            let index = index{
            delegate.teacherCourseTableViewCell(self, expandButtonTappedFor: index)
        }
    }
    
    @objc func openTaskButton1Pressed() {
        
        self.delegate?.taskButtonTappedFor(cell: self.index!, taskIndex: 0)
    }
    
    @objc func openTaskButton2Pressed() {
        self.delegate?.taskButtonTappedFor(cell: self.index!, taskIndex: 1)
    }
}
