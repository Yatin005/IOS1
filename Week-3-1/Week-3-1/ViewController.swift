//
//  ViewController.swift
//  Week-3-1
//
//  Created by Yatin Parulkar on 2025-01-24.
//


import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var numbers = ["1", "2", "3", "4"]
    var letters = ["a", "b", "c", "d"]
    
    @IBOutlet weak var FirstPicker: UIPickerView!
    
    @IBOutlet weak var SecondPicker: UIPickerView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstPicker.delegate = self
        FirstPicker.dataSource = self
        FirstPicker.tag = 1
        
        SecondPicker.delegate = self
        SecondPicker.dataSource = self
        SecondPicker.tag = 2
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return numbers.count
        } else {
            return letters.count
        }
    }
    
    internal func pickerView(_ pickerView: UIPickerView,
                             titleForRow row: Int,
                             forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return numbers[row]
        } else {
            return letters[row]
        }
        
       
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            letters.append(numbers[row])
            numbers.remove(at: row)
            FirstPicker.reloadAllComponents()
            SecondPicker.reloadAllComponents()
        } else {
            numbers.append(letters[row])
            letters.remove(at: row)
            FirstPicker.reloadAllComponents()
            SecondPicker.reloadAllComponents()
        }
    }
}
