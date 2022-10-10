//
//  TeacherCourseTableViewCell.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit
//import SkeletonView

protocol TeacherCourseTableViewCellDelegate: AnyObject {
    func teacherCourseTableViewCell(_ teacherCourseTableViewCell: TeacherCourseTableViewCell, expandButtonTappedFor index: IndexPath)
    
    func taskButtonTappedFor(cell indexPath: IndexPath, taskIndex: Int)
    
    func changeIsSelectedCellState(with indexPath: IndexPath, state: Bool)
}

class TeacherCourseTableViewCell: UITableViewCell, UIScrollViewDelegate {

    static let reuseIdentifier = "TeacherCourseCell"
    
    var index: IndexPath?
    
    var isCellSecelted: Bool = false 
    
    lazy var eventViewPadding: CGFloat = {
        return UIScreen.main.bounds.width == 375 ? 10 : 20
    }()
    
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
//        view.isSkeletonable = true
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
//        view.isSkeletonable = true
        
        return view
    }()
    
    lazy var lessonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taskMockImage")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.isSkeletonable = true
        return imageView
    }()
    
    lazy var separatorForLessonInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .systemGray2
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        label.isSkeletonable = true
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        label.isSkeletonable = true
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
        button.isHidden = !isCellSecelted
        button.isEnabled = isCellSecelted
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.isSkeletonable = true
//        contentView.isSkeletonable = true
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
