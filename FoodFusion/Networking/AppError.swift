//
//  AppError.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 07/11/23.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        
        case .errorDecoding:
            return "Response could not de decoded."
        case .unknownError:
            return "I have no idea what go on!!"
        case .invalidUrl:
            return "Invalid Url"
        case .serverError(let error ):
            return error
        }
    }
}
