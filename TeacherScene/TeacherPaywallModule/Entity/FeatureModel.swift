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
    
    init(image: UIImage, name: String, description: String) {
        self.featureImage = image
        self.featureName = name
        self.featureDescription = description
    }
}
