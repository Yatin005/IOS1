//
//  ViewController.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-14.
//

import UIKit


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    
    var model: ProductManager?
    
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var tottal: UILabel!
    var selectedProductID : UUID?
    var selectProduct : Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tottal.text = "Total"
        quantity.text = ""
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        table.delegate = self
        table.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.productList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = model?.productList[indexPath.row].name
        cell.detailTextLabel?.text! = String(model?.productList[indexPath.row].quantity ?? 0)
        
        return cell
    }
    
    
    @IBAction func digit(_ sender: Any) {
        
        if selectProduct != nil {
            quantity.text! += (sender as AnyObject).titleLabel?.text ?? ""
            let quantity = Int(quantity.text!) ?? 0
            let price = selectProduct?.price ?? 0
            print(quantity, price, (quantity * price))
            tottal.text! = String((quantity * price))
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please Select Type of Product", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: false)
            
        }
    }
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProductID = model?.productList[indexPath.row].id
        selectProduct = model?.productList[indexPath.row]
        label.text = model?.productList[indexPath.row].name ?? "Error"
        if quantity.text?.count ?? 0 > 0 {
            let quantity = Int(quantity.text!) ?? 0
            let price = selectProduct?.price ?? 0
            tottal.text! = String((quantity * price))
        }
    }
    
    @IBAction func ByClicked(_ sender: UIButton) {
        
        
        if let id = selectedProductID {
            if quantity.text?.count ?? 0 > 0 {
                let amount = Int(quantity.text!)
                if ((model?.isAvaliable(productID: selectedProductID!, quatity: amount!))!) {
                    model?.buy_Product(productID: selectedProductID!, newQuatity: amount!)
                } else{
                    let alert = UIAlertController(title: "Alert", message: "Pruchase Failed, not sufficent stock", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: false)
                }
                table.reloadData()
            }
            else{
                let alert = UIAlertController(title: "Alert", message: "Please Enter Amount of Product for  Pruchase", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: false)
            }
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please Select Type of Product", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: false)
        }
        tottal.text = ""
        quantity.text = ""
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

