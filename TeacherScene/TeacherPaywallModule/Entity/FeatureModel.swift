//
//  FeatureModel.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation
import UIKit

struct FeatureModel {
    
    var featureImage: UIImage
    var featureName: String
    var featureDescription: String
    
//    property just for test
    var backgroundColor: UIColor
    
    init(image: UIImage, name: String, description: String, backgroundColor: UIColor) {
        self.featureImage = image
        self.featureName = name
        self.featureDescription = description
        self.backgroundColor = backgroundColor
    }
}
