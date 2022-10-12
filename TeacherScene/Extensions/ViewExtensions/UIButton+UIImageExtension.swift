//
//  UIButtonExtension.swift
//  TeacherScene
//
//  Created by Игорь Корабельников on 29.09.2022.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(_ backgroundColor: UIColor, forState: UIButton.State) {
            setBackgroundImage(.pixel(ofColor: backgroundColor), for: forState)
        }
        
        func setInsets(forContentPadding contentPadding: UIEdgeInsets,imageTitlePadding: CGFloat) {
                self.contentEdgeInsets = UIEdgeInsets(
                    top: contentPadding.top,
                    left: contentPadding.left,
                    bottom: contentPadding.bottom,
                    right: contentPadding.right + imageTitlePadding
                )
                self.titleEdgeInsets = UIEdgeInsets(
                    top: 0,
                    left: imageTitlePadding,
                    bottom: 0,
                    right: -imageTitlePadding
                )
            }
        
        func makeASStyleCircularButton(title: String,cornerRadius: CGFloat = 0, backgroundColor: UIColor, titleColor: UIColor = .white) {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            setTitle(title, for: .normal)
            setTitleColor(titleColor, for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            setBackgroundColor(backgroundColor, forState: .normal)
        }

}

// MARK: UIImage extension

extension UIImage {
    
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = image else { return UIImage()}
        return image
    }
    
    static func pixel(ofColor color: UIColor) -> UIImage {

     let lightModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .light)

     let darkModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .dark)

     lightModeImage.imageAsset?.register(darkModeImage, with: UITraitCollection(userInterfaceStyle: .dark))

     return lightModeImage

     }

     static private func generatePixel(ofColor color: UIColor, userInterfaceStyle: UIUserInterfaceStyle) -> UIImage {

     var image: UIImage!

     if #available(iOS 13.0, *) {
         UITraitCollection(userInterfaceStyle: userInterfaceStyle).performAsCurrent { image = .generatePixel(ofColor: color) }
     } else {
        image = .generatePixel(ofColor: color)
     }

     return image
     }

     static private func generatePixel(ofColor color: UIColor) -> UIImage {
     let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

     UIGraphicsBeginImageContext(pixel.size)
     defer { UIGraphicsEndImageContext() }

     guard let context = UIGraphicsGetCurrentContext() else {
     return UIImage()
     }

     context.setFillColor(color.cgColor)
     context.fill(pixel)

     return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}

extension UISegmentedControl {
    func removeBorders() {
            setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
            setBackgroundImage(imageWithColor(color: selectedSegmentTintColor!), for: .selected, barMetrics: .default)
            setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        }

        
        private func imageWithColor(color: UIColor) -> UIImage {
            let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context!.setFillColor(color.cgColor);
            context!.fill(rect);
            let image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return image!
        }
}
