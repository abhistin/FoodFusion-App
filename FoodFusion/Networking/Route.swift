//
//  Route.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 06/11/23.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        }
    }
}
