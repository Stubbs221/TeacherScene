//
//  TeacherCourseView + SetupUI.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 26.09.2022.
//

import UIKit

extension TeacherCourseView {
    func setupUI() {
        view.addSubview(teacherCourseTableView)
        
        NSLayoutConstraint.activate([
            teacherCourseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teacherCourseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teacherCourseTableView.topAnchor.constraint(equalTo: view.topAnchor),
            teacherCourseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Онлайн-курс"
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white]
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            gradient.frame = bounds
            gradient.colors = [UIColor.hexStringToUIColor(hex: "7478DC").cgColor, UIColor.hexStringToUIColor(hex: "C36BE5").cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImage(from: gradient) {
                appearance.backgroundImage = image
            }
        }
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//        navigationController?.navigationBar.contentView
        if #available(iOS 15.0, *) {
            navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
    
    func getImage(from gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
            
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
