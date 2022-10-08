//
//  TeacherCourseView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit
import SkeletonView

protocol TeacherCourseViewInput {
    var output: TeacherCourseViewOutput? { get set }
    
    var dataModel: DataModel? { get set }
    
    func updateDataSource(with dataModel: DataModel)
    func updateDataSource(with error: Error)
}

protocol TeacherCourseViewOutput {
    func contactWithTelegramButtonTapped()
    
    func userTappedOpenTaskButton(for task: Task)
}


class TeacherCourseView: UIViewController, TeacherCourseViewInput  {
    
    
    
    

    var output: TeacherCourseViewOutput?
    
    var selectedIndex: IndexPath?
    
    let sections = ["Ближайшая трансляция", "Учебный план"]
    
    var dataModel: DataModel? {
        didSet {
            teacherCourseTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

        setupUI()
        setupNavigation()
        teacherCourseTableView.showSkeleton(usingColor: .wetAsphalt, transition: .crossDissolve(0.25))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        teacherCourseTableView.isSkeletonable = true
        
//        teacherCourseTableView.showAnimatedSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
    
    lazy var tableViewHeader: UITableViewHeaderFooterView = {
        let header = ContactTelegramTableViewHeader()
        header.delegate = self
        return header
    }()
    
    lazy var teacherCourseTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeacherCourseTableViewCell.self, forCellReuseIdentifier: TeacherCourseTableViewCell.reuseIdentifier)
        tableView.register(TeacherCourseTableViewSectionHeader.self, forHeaderFooterViewReuseIdentifier: TeacherCourseTableViewSectionHeader.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.allowsSelection = true

        tableView.tableHeaderView = tableViewHeader
        
        
        
        tableView.backgroundColor = UIColor(named: "appBackgroundWhite")
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false

        return tableView
    }()
    

    func updateDataSource(with dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    func updateDataSource(with error: Error) {
        #warning("добавить сообщение пользователю что данные не пришли с сети")
    }
    
    func changeIsSelectedCellState(with indexPath: IndexPath, state: Bool) {
        if indexPath.section == 0 {
            self.dataModel?.nextEvent?.isCellSelected = state
        } else {
            self.dataModel?.events[indexPath.row].isCellSelected = state
        }
    }
}
