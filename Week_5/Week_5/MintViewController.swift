//
//  MintViewController.swift
//  Week_5
//
//  Created by Yatin Parulkar on 2025-02-07.
//

import UIKit

class MintViewController: UIViewController {
    @IBOutlet weak var mintLabel: UILabel!
    
    @IBOutlet weak var changeBG: UIButton!
    var userName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        mintLabel.text = "Welcome \(userName)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBG(_ sender: Any) {
        
        self.view.backgroundColor = UIColor(_colorLiteralRed: 255, green: 128, blue: 0, alpha: 1)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
