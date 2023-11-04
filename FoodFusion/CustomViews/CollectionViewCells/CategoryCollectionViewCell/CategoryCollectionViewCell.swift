//
//  CategoryCollectionViewCell.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 04/11/23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryImageVIew: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageVIew.kf.setImage(with: category.image?.asURL)
    }

}
