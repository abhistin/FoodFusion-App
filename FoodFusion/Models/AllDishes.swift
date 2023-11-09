//
//  AllDishes.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 09/11/23.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
