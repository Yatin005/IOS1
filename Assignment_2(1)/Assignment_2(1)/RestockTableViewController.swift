//
//  RestockTableViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-28.
//

import UIKit

class RestockTableViewController: UITableViewController {
 
    @IBOutlet weak var restoke: UITableView!
    
    var model: ProductManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        restoke.dataSource = self
        restoke.delegate = self
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.productList.count ?? 0
    }
 @IBOutlet weak var amountIB: UITextField!
    
    @IBAction func restock(_ sender: Any) {
        if let index = restoke.indexPathForSelectedRow?.row
        {
            if let stock:Int = Int(amountIB.text ?? ""){
                let localModel =  model!
                localModel.update_Quantity(productID: localModel.productList[index].id, newQuatity: localModel.productList[index].quantity + stock)
                restoke.reloadData()
            } else {
                let alert = UIAlertController(title: "Alert", message: "Invalid Restock Amount", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: false)
            }
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please Select Product To Restock", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "res") ?? UITableViewCell()
        cell.textLabel?.text = model?.productList[indexPath.row].name
        cell.detailTextLabel?.text! = String(model?.productList[indexPath.row].quantity ?? 0)
        
        return cell
    }

    @IBAction func onCancel(_ sender: Any) {
        restoke.deselectRow(at: restoke.indexPathForSelectedRow!, animated: true)
    }
    /*
    // MARK    : - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
