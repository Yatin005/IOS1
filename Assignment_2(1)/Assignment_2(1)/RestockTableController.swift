//
//  RestockTableController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-28.
//

import UIKit

class RestockTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return model?.productList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "restockTile", for: indexPath)
        cell.textLabel?.text = model?.productList[indexPath.row].name
        cell.detailTextLabel?.text! = String(model?.productList[indexPath.row].quantity ?? 0)
        return cell
    }
    
    
    var model : ProductManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        restockTableOutlet.delegate = self
        restockTableOutlet.dataSource = self
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        textFieldOutlet.text=""
    }

    
   
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var restockTableOutlet: UITableView!
    
    
    @IBAction func onRestock(_ sender: Any) {
        if let index = restockTableOutlet.indexPathForSelectedRow?.row
        {
            if let stock: Int = Int(textFieldOutlet.text ?? ""){
                let localModel =  model!
                localModel.update_Quantity(productID: localModel.productList[index].id, newQuatity: localModel.productList[index].quantity + stock)
                textFieldOutlet.text=""
                restockTableOutlet.reloadData()
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
    
    @IBAction func onCancel(_ sender: Any) {
        if let indexPath = restockTableOutlet.indexPathForSelectedRow{
            restockTableOutlet.deselectRow(at: indexPath, animated: false)
        }
        
    }
    

}
