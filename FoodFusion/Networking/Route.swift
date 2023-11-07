//
//  Route.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 06/11/23.
//

import Foundation

enum Route {
    static let baseUrl = "https://foodfusion.glitch.me"
    case temp
    
    var description: String {
        switch self {
        case .temp:
            return "/temp"
        }
    }
}
