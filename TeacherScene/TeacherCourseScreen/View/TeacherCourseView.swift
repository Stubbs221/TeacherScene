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
}

protocol TeacherCourseViewOutput {
    
}

class TeacherCourseView: UIViewController, TeacherCourseViewInput {
    
    

    var output: TeacherCourseViewOutput?
    
    var dataModel: DataModel? {
        didSet {
            teacherCourseTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        
    }
    
    lazy var teacherCourseTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeacherCourseTableViewCell.self, forCellReuseIdentifier: TeacherCourseTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    

    func updateDataSource(with dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    
}
