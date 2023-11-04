//
//  HomeViewController.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 04/11/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Indian Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "African Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Italian Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Roman Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "German Dish", image: "https://picsum.photos/100/200")
    ]
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 98),
        .init(id: "id1", name: "Pizza", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 424)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName:  CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier )
        
        popularCollectionView.register(UINib(nibName:  DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier )
    }

}
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
