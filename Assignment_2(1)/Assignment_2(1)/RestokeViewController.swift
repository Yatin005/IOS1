//
//  RestokeViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-26.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var quantityTextField: UITextField!

    var products: [Product] = []
    var selectedProduct: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func restockPressed(_ sender: UIButton) {
        guard let product = selectedProduct, let quantity = Int(quantityTextField.text ?? "") else {
            showAlert(message: "Select a product and enter a valid quantity")
            return
        }
        
        product.quantity += quantity
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestockCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = "\(product.name) - \(product.quantity) left"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = products[indexPath.row]
    }
}
