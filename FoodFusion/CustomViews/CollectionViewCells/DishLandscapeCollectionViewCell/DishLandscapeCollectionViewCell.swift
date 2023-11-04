//
//  DishLandscapeCollectionViewCell.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 04/11/23.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: DishLandscapeCollectionViewCell.self)
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
