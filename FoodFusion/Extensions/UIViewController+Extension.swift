//
//  UIViewController+Extension.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 05/11/23.
//

import UIKit
extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
