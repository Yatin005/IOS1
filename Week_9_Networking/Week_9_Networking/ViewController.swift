//
//  ViewController.swift
//  Week_9_Networking
//
//  Created by Yatin Parulkar on 2025-03-14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkingManager.shared.getAllCitiesFromAPI(serarchTearm: "tor")
    }


}

