//
//  Order.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 05/11/23.
//

import Foundation

struct Order: Codable {
    let id: String?
    let name: String?
    let dish: Dish?
}
