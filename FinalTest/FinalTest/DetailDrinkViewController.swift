//
//  DetailDrinkViewController.swift
//  FinalTest
//
//  Created by Yatin Parulkar on 2025-04-11.
//

import UIKit

class DetailDrinkViewController: UIViewController {
    @IBOutlet weak var strDrinkThumb: UIImageView!
    @IBOutlet weak var strDrink: UILabel!
    @IBOutlet weak var strCategory: UILabel!
    @IBOutlet weak var strAlcoholic: UILabel!
    @IBOutlet weak var strInstruction: UILabel!
    @IBOutlet weak var strInstructionES: UILabel!
    @IBOutlet weak var strInstructionDE: UILabel!
    
    var drinkID: String?
    var drinkDetail: DrinkDetail?
    let apiservice = APIService()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let drinkID = drinkID {
                   Task {
                       do {
                           if let detail = try await apiservice.fetchDrinkDetails(withID: drinkID) {
                               DispatchQueue.main.async {
                                   self.drinkDetail = detail
                                   self.updateUI()
                               }
                           }
                       } catch {
                           print("Error fetching drink details: \(error)")
                           DispatchQueue.main.async {
                               
                           }
                       }
                   }
               }
           }

           func updateUI() {
               if let detail = drinkDetail {
                   strDrink.text = detail.strDrink
                   strCategory.text = (detail.strCategory ?? "N/A")
                   strAlcoholic.text =  (detail.strAlcoholic ?? "N/A")
                   strInstruction.text = detail.strInstructions
                   strInstructionES.text = detail.strInstructionsES
                   strInstructionDE.text = detail.strInstructionsDE

                   if let imageURLString = detail.strDrinkThumb, let imageURL = URL(string: imageURLString) {
                       Task {
                           do {
                               let (data, _) = try await URLSession.shared.data(from: imageURL)
                               if let image = UIImage(data: data) {
                                   DispatchQueue.main.async {
                                       self.strDrinkThumb.image = image
                                   }
                               } else {
                                   DispatchQueue.main.async {
                                       self.strDrinkThumb.image = UIImage(systemName: "photo")
                                   }
                               }
                           } catch {
                               print("Error loading image: \(error)")
                               DispatchQueue.main.async {
                                   self.strDrinkThumb.image = UIImage(systemName: "photo")
                               }
                           }
                       }
                   } else {
                       strDrinkThumb.image = UIImage(systemName: "photo")
                   }
               }
           }
       }
