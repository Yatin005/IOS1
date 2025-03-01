//
//  NewHistoryTableController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-28.
//

import UIKit

class NewHistoryTableController: UITableViewController {
    var model : ProductManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model?.historyList.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let localModel = model!
        let cell = tableView.dequeueReusableCell(withIdentifier: "h1", for: indexPath)
        cell.textLabel?.text = localModel.historyList[indexPath.row].productName
        cell.detailTextLabel?.text = "\(localModel.historyList[indexPath.row].quantity)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let hs = segue.destination as! HistoryViewController
        let localModel = self.model!
        let index  = tableView.indexPathForSelectedRow?.row ?? 0
        print(index, localModel.historyList[index])
        hs.object = localModel.historyList[index]
    }

}
