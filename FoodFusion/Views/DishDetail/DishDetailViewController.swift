//
//  DishDetailViewController.swift
//  FoodFusion
//
//  Created by Abhishek Bhardwaj on 05/11/23.
//

import UIKit
import ProgressHUD
class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        nameField.delegate = self
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please Enter Your Name.")
            return
        }
        ProgressHUD.show("Placing your order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self] (result) in
            switch result {
                
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.🧑‍🍳")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let targetVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        self?.navigationController?.pushViewController(targetVC, animated: true)
                    
                }
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}

extension DishDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
}
