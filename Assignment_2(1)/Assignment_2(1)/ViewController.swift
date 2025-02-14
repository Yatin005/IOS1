//
//  ViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    struct product {
        var name: String
    }
    let products = ["Pants", "Shoes", "Hats" , "T-Shirts", "Drases"]

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count
        }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

         let product = products[indexPath.row]
        cell.textLabel?.text = products.first

                return cell
    }

}

