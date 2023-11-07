//
//  DishListTableViewCell.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 05/11/23.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static var identifier: String = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        descriptionLbl.text = dish.description
    }
    func setup(order: Order) {
        titleLbl.text = order.dish?.name
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        descriptionLbl.text = order.name
    }
}

