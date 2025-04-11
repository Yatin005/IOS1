//
//  DrinkModel.swift
//  FinalTest
//
//  Created by Yatin Parulkar on 2025-04-11.
//
// Drink.swift
import Foundation

struct Drink: Codable {
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String?
}

struct DrinksResponse: Codable {
    let drinks: [Drink]?
}


struct DrinkDetail: Codable {
    let idDrink: String?
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strInstructions: String?
    let strInstructionsES: String?
    let strInstructionsDE: String?
    let strDrinkThumb: String?
}

struct DrinkDetailsResponse: Codable {
    let drinks: [DrinkDetail]?
}





























// APIService.swift


// IngredientSearchViewController.swift

//
//// DrinkDetailViewController.swift
//import UIKit
//
//class DrinkDetailViewController: UIViewController {
//
//    var drinkID: String?
//    var drinkDetail: DrinkDetail?
//
//    @IBOutlet weak var drinkImageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var categoryLabel: UILabel!
//    @IBOutlet weak var alcoholicLabel: UILabel!
//    @IBOutlet weak var instructionsLabel: UILabel!
//    @IBOutlet weak var instructionsESLabel: UILabel!
//    @IBOutlet weak var instructionsDELabel: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()

//
//    func updateUI() {
//        if let detail = drinkDetail {
//            nameLabel.text = detail.strDrink
//            categoryLabel.text = "Category: " + (detail.strCategory ?? "N/A")
//            alcoholicLabel.text = "Type: " + (detail.strAlcoholic ?? "N/A")
//            instructionsLabel.text = detail.strInstructions
//            instructionsESLabel.text = detail.strInstructionsES
//            instructionsDELabel.text = detail.strInstructionsDE
//
//            if let imageURLString = detail.strDrinkThumb, let imageURL = URL(string: imageURLString) {
//                URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, error in
//                    DispatchQueue.main.async {
//                        if let data = data, let image = UIImage(data: data) {
//                            self?.drinkImageView.image = image
//                        } else {
//                            self?.drinkImageView.image = UIImage(systemName: "photo")
//                        }
//                    }
//                }.resume()
//            } else {
//                drinkImageView.image = UIImage(systemName: "photo")
//            }
//        }
//    }
//}
