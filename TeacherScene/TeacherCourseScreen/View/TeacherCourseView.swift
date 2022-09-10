//
//  TeacherCourseView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

protocol TeacherCourseViewInput {
    var output: TeacherCourseViewOutput? { get set }
}

protocol TeacherCourseViewOutput {
    
}

class TeacherCourseView: UIViewController, TeacherCourseViewInput {

    var output: TeacherCourseViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
