//
//  HistoryViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-26.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
        var history: [PurchaseHistory] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return history.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
            let purchase = history[indexPath.row]
            cell.textLabel?.text = "\(purchase.name) x\(purchase.quantity) - $\(purchase.totalPrice)"
            return cell
        }
    }
