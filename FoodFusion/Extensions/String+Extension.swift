//
//  String+Extension.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 04/11/23.
//

import Foundation
extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
