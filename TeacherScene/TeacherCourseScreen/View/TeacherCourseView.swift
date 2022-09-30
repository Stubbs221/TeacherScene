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

//class Section {
//    let title: String
//    let options: [String]
//    var isOpened: Bool = false
//
//    init(title: String, options: [String], isOpened: Bool) {
//        self.title = title
//        self.options = options
//        self.isOpened = isOpened
//    }
//}

class TeacherCourseView: UIViewController, TeacherCourseViewInput {
    
    

    var output: TeacherCourseViewOutput?
    
    var selectedIndex: IndexPath? = nil
    
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
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeacherCourseTableViewCell.self, forCellReuseIdentifier: TeacherCourseTableViewCell.reuseIdentifier)
        tableView.register(ContactTelegramTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ContactTelegramTableViewHeader.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "appBackgroundWhite")
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        return tableView
    }()
    

    func updateDataSource(with dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    func updateDataSource(with error: Error) {
        #warning("добавить сообщение пользователю что данные не пришли с сети")
    }
    
    
}
