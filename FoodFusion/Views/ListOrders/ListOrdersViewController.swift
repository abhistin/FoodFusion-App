//
//  ListOrdersViewController.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 05/11/23.
//

import UIKit

class ListOrdersViewController: UIViewController {

    var orders: [Order] = [
        .init(id: "id1", name: "Abhishek", dish: .init(id: "id1", name: "Egg Roll", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 24)),
        .init(id: "id2", name: "Priyag", dish: .init(id: "id1", name: "Pizza", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 124)),
        .init(id: "id3", name: "Param", dish: .init(id: "id1", name: "Pasta", description: "This is the best I have ever had.", image: "https://picsum.photos/100/200", calories: 100))
    ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        
    }
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
