//
//  UITextView + Extension.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 16.10.2022.
//

import UIKit

extension UITextView {
    func updateTextFont() {

        if (self.text.isEmpty || self.bounds.size.equalTo(CGSize.zero)) {
            print("Text Empty")
        }

        let textViewSize = self.frame.size
        let fixedWidth = textViewSize.width
        let expectSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)))

        var expectFont = self.font
        if (expectSize.height > textViewSize.height) {

            while (self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height > textViewSize.height) {
                expectFont = self.font!.withSize(self.font!.pointSize - 1)
                self.font = expectFont
            }
        }
        else {
            while (self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height < textViewSize.height) {

                expectFont = self.font!.withSize(self.font!.pointSize + 1)
                self.font = expectFont
            }
        }
    }
}
