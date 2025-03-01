//
//  HistoryViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-28.0
//

import UIKit

class HistoryViewController: UIViewController {
    
    
    var object : History?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
        
        // Do any additional setup after loading the view.
        func loadData(){
            if let data = object {
                self.title = data.productName
                name.text = "Product Name: \(data.productName)"
                price.text = "Product Price: \(data.price)"
                qty.text = "Product Qty: \(data.quantity)"
                date.text = "Product Date: \(data.timestamp.formatted())"
            }
        }

    }
