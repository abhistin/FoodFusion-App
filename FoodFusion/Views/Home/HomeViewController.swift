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
    @IBOutlet weak var specialsColectionView: UICollectionView!
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
    var specials: [Dish] = [
        .init(id: "id1", name: "Paneer Tikka", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 104),
        .init(id: "id1", name: "Egg Roll", description: "Taste is very nice of this dish.", image: "https://picsum.photos/100/200", calories: 20)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName:  CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier )
        
        popularCollectionView.register(UINib(nibName:  DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier )
        
        specialsColectionView.register(UINib(nibName:  DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier )
    }

}
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsColectionView:
            return specials.count
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
        case specialsColectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            navigationController?.pushViewController(controller, animated: true)
            controller.category = categories[indexPath.row]
        }
        else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
