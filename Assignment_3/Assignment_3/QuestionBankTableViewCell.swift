//
//  QuestionBankTableViewCell.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import UIKit

class QuestionBankTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var QuestionLabel: UILabel!
    
    
    @IBOutlet weak var CorrectAnswer: UILabel!
    
    @IBOutlet weak var Incorrect1: UILabel!
    
    @IBOutlet weak var Incorrect2: UILabel!
    
    @IBOutlet weak var Incorrect3: UILabel!
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
