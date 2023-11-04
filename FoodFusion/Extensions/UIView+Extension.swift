//
//  UIView+Extension.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 03/11/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
