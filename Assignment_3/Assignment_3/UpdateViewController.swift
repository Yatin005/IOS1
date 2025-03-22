//
//  UpdateViewController.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import UIKit

class UpdateViewController: UIViewController {
    
    var selectQuestion: Questions?
    var localModel: Quiz?

    override func viewDidLoad() {
        super.viewDidLoad()
        localModel = ((UIApplication.shared.delegate) as! AppDelegate).model
        // Do any additional setup after loading the view.
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
