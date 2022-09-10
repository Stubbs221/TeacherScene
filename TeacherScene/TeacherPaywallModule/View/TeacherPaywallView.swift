//
//  TeacherPaywallView.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import UIKit

protocol TeacherPaywallViewInput {
    var output: TeacherPaywallViewOutput? { get set }
}

protocol TeacherPaywallViewOutput {
    
}

class TeacherPaywallView: UIViewController, TeacherPaywallViewInput {
    
    
    var output: TeacherPaywallViewOutput?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        
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
