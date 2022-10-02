//
//  TeacherCourseView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

protocol TeacherCourseViewInput {
    var output: TeacherCourseViewOutput? { get set }
    
    var dataModel: DataModel? { get set }
    
    func updateDataSource(with dataModel: DataModel)
    func updateDataSource(with error: Error)
}

protocol TeacherCourseViewOutput {
    
}


class TeacherCourseView: UIViewController, TeacherCourseViewInput {
    
    

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
        
    }
    
    lazy var teacherCourseTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeacherCourseTableViewCell.self, forCellReuseIdentifier: TeacherCourseTableViewCell.reuseIdentifier)
        tableView.register(TeacherCourseTableViewSectionHeader.self, forHeaderFooterViewReuseIdentifier: TeacherCourseTableViewSectionHeader.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        
        tableView.tableHeaderView = ContactTelegramTableViewHeader()
        
        
        
        tableView.backgroundColor = UIColor(named: "appBackgroundWhite")
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
//        if #available(iOS 15.0, *) {
//            tableView.sectionHeaderTopPadding = 120
//        } else {
//            // Fallback on earlier versions
//        }
        return tableView
    }()
    

    func updateDataSource(with dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    func updateDataSource(with error: Error) {
        #warning("добавить сообщение пользователю что данные не пришли с сети")
    }
    
    
}
