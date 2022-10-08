//
//  TeacherCourseTableViewCell.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit
import SkeletonView

protocol TeacherCourseTableViewCellDelegate: AnyObject {
    func teacherCourseTableViewCell(_ teacherCourseTableViewCell: TeacherCourseTableViewCell, expandButtonTappedFor index: IndexPath)
    
    func taskButtonTappedFor(cell indexPath: IndexPath, taskIndex: Int)
}

class TeacherCourseTableViewCell: UITableViewCell, UIScrollViewDelegate {

    static let reuseIdentifier = "TeacherCourseCell"
    
    var index: IndexPath?
    
    var isCellSecelted: Bool = false
    
    weak var delegate: TeacherCourseTableViewCellDelegate?
    
    
    
    
    let background: UIView = {
        let view = UIView()
        return view
    }()
    
    
    lazy var eventView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = false
        view.isSkeletonable = true
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
        view.isSkeletonable = true
        
        return view
    }()
    
    lazy var lessonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taskMockImage")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isSkeletonable = true
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
        label.isSkeletonable = true
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.isSkeletonable = true
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
//        button.imageView?.isUserInteractionEnabled = true
        return button
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
        button.isHidden = !isCellSecelted
        button.isEnabled = isCellSecelted
        return button
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
        button.isHidden = !isCellSecelted
        button.isEnabled = isCellSecelted
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isSkeletonable = true
        contentView.isSkeletonable = true
        
        
        setupUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

  
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
        
        #warning("при добавлении интерактивного элемента на контентвью - все срабатывает")
        contentView.addSubview(expandeCellButton)
        self.expandeCellButton.addTarget(self, action: #selector(expandCellButtonPressed(_:)), for: .touchUpInside)
        
        lessonInfoView.addSubview(estimatedTimeLabel)
        
        
        eventView.addSubview(taskNumberLabel1)
        eventView.addSubview(taskDescriptionLabel1)
        
        #warning("если интерактивный элемент не дочерний для контентВью, а для любого его дочернего сабвью, то экшн не обрабатывается")
        contentView.addSubview(openTaskButton1)
        self.openTaskButton1.addTarget(self, action: #selector(openTaskButton1Pressed), for: .touchUpInside)
        
        eventView.addSubview(taskNumberLabel2)
        eventView.addSubview(taskDescriptionLabel2)
        
        #warning("тут по такому же сценарию")
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
            dateLabel.leadingAnchor.constraint(equalTo: lessonImageView.trailingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: lessonInfoView.trailingAnchor, constant: -20),
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
    }
    
    
    func dealWithTasks() {
        
       
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
        
        self.openTaskButton1.isHidden = !data.isCellSelected
        self.openTaskButton2.isHidden = !data.isCellSelected
        self.openTaskButton1.isEnabled = data.isCellSelected
        self.openTaskButton2.isEnabled = data.isCellSelected
    }

    func animate() {
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.contentView.layoutIfNeeded()
        }
    }

    @objc func expandCellButtonPressed(_ sender: UIButton) {
//        sender.imageView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        print("pressed button with index \(String(describing: self.index))")
//        self.isCellSecelted = !self.isCellSecelted
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
