//
//  Dish.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 04/11/23.
//

import Foundation

struct Dish: Codable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"

    }
}
