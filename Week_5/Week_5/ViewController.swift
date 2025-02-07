//
//  ViewController.swift
//  Week_5
//
//  Created by Yatin Parulkar on 2025-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "red"){
                    
                    var redVC =  segue.destination as! MintViewController
                    
            if let userInput = name.text , !userInput.isEmpty {
                 
                        
                    }
                }
    }

}

