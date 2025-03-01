//
//  ViewController.swift
//  Yatin_parulkat_midterm
//
//  Created by Yatin Parulkar on 2025-02-28.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var name_Text: UITextField!
   
   
    @IBOutlet weak var tableview: UITableView!
    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableview.delegate = self
        tableview.dataSource = self
    }

    @IBAction func saveBook(_ sender: UIButton)
    {
        guard let title = name_Text.text, !title.isEmpty
        else {
            return
        }
        let newBook = Book(title: title, isRead: false);books.append(newBook)
        tableview.reloadData()
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath)
        let book = books[indexPath.row]

        cell.textLabel?.text = book.title

        let readSwitch = UISwitch(frame: CGRect(x: cell.frame.width - 70, y: 10, width: 0, height: 0))
        readSwitch.isOn = book.isRead
        readSwitch.tag = indexPath.row
        readSwitch.addTarget(self, action: #selector(toggleReadStatus(_:)), for: .valueChanged)
        cell.contentView.addSubview(readSwitch)

        cell.textLabel?.textColor = book.isRead ? .red : .green

        return cell
    }

    @objc func toggleReadStatus(_ sender: UISwitch) {
        var book = books[sender.tag]
        book.isRead = sender.isOn
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableview.reloadRows(at: [indexPath], with: .automatic)
    }
}

