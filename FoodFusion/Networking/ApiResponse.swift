//
//  ApiResponse.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 07/11/23.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
