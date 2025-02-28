//
//  BookTableviewCell.swift
//  Yatin_parulkat_midterm
//
//  Created by Yatin Parulkar on 2025-02-28.
//
class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var readSwitch: UISwitch!

    var book: Book?

    var onSwitchChange: ((Bool) -> Void)?

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        onSwitchChange?(sender.isOn)
    }
}
