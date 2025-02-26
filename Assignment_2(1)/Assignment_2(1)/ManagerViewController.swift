//
//  ManagerViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-21.
//

import UIKit

class ManagerViewController: UIViewController {

    var products: [Product] = []
       var history: [PurchaseHistory] = []

       @IBAction func historyPressed(_ sender: UIButton) {
           let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
           historyVC.history = history
           navigationController?.pushViewController(historyVC, animated: true)
       }

       @IBAction func restockPressed(_ sender: UIButton) {
           let restockVC = storyboard?.instantiateViewController(withIdentifier: "RestockViewController") as! RestockViewController
           restockVC.products = products
           navigationController?.pushViewController(restockVC, animated: true)
       }
   }
