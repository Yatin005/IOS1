//
//  ViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-14.
//

import UIKit


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var products: [Product] = [
        Product(name: "Hat", price: 10, quantity: 10),
        Product(name: "Shirt", price: 20, quantity: 5),
        Product(name: "Shoes", price: 50, quantity: 13),
        Product(name: "T-Shirts", price: 20, quantity: 30),
        Product(name: "Dresses", price: 25, quantity: 20)
    ]
    
    var selectedProduct: Product?
    var selectedQuantity: Int = 0
    var history: [PurchaseHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        resetUI()
    }
    
    func resetUI() {
        productLabel.text = "Select Product"
        quantityLabel.text = ""
        totalLabel.text = "$0.00"
        selectedQuantity = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = "\(product.name) - \(product.quantity) "
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = products[indexPath.row]
        productLabel.text = selectedProduct?.name
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        quantityLabel.text! += sender.titleLabel?.text ?? ""
        calculateTotal()
     
    }
    
    func calculateTotal() {
        if let product = selectedProduct {
            let total = (Int(quantityLabel.text!) ?? 0) * product.price
            totalLabel.text = "$\(total)"
        }
         
    }
    
    @IBAction func BuyClicked(_ sender: Any) {
        guard let product = selectedProduct else {
            showAlert(title: "Error", message: "Select a product first")
            return
        }
        
        guard selectedQuantity > 0, selectedQuantity <= product.quantity else {
            showAlert(title: "Error", message: "Not enough stock")
            return
           
        }
    
        
        // Update
        if let index = products.firstIndex(where: { $0.name == product.name }) {
            products[index].quantity -= selectedQuantity
        }
        
        
        
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
    }
    @IBAction func managerClicked(_ sender: Any) {
        let managerVC = storyboard?.instantiateViewController(identifier: "ManagerViewController") as! ManagerViewController
        managerVC.products = products
        managerVC.history = history
        managerVC.delegate = self
        navigationController?.pushViewController(managerVC, animated: true)
        
    }
}
