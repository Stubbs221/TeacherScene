//
//  UIViewExtensions.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 02.10.2022.
//

import UIKit

extension UIImage {
    func imageRotated(on degrees: CGFloat) -> UIImage {
        // Following code can only rotate images on 90, 180, 270.. degrees.
        let degrees = round(degrees / 90) * 90
        let sameOrientationType = Int(degrees) % 180 == 0
        let radians = CGFloat.pi * degrees / CGFloat(180)
        let newSize = sameOrientationType ? size : CGSize(width: size.height, height: size.width)

        UIGraphicsBeginImageContext(newSize)
        defer {
          UIGraphicsEndImageContext()
        }

        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
          return self
        }

        ctx.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        ctx.rotate(by: radians)
        ctx.scaleBy(x: 1, y: -1)
        let origin = CGPoint(x: -(size.width / 2), y: -(size.height / 2))
        let rect = CGRect(origin: origin, size: size)
        ctx.draw(cgImage, in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image ?? self
      }

}
