//
//  ViewController.swift
//  Week_6
//
//  Created by Yatin Parulkar on 2025-02-14.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate { 
    
    var selectedImageData : Data? = UIImage(named: "empty")?.pngData()

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
   
    @IBOutlet weak var userImage: UIImageView!
    
    var model: StudentManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func UploadImage(_ sender: Any) {
        let c = UIImagePickerController()
                c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera:.photoLibrary
                c.delegate = self
                c.allowsEditing = false
                
                
                present(c, animated: true)
                
    }
    func imagePickerController(_ picker: UIImagePickerController,
                                  didFinishPickingMediaWithInfo info:
       [UIImagePickerController.InfoKey : Any]){
           print("image selected")
           
           let selectedImage = info[.originalImage] as? UIImage
           selectedImageData = selectedImage?.pngData()
        userImage.image = selectedImage
           dismiss(animated: true, completion: nil)
       }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            print("picker canceled")
            dismiss(animated: true, completion: nil)
            
        }
    @IBAction func SaveNewStudent(_ sender: Any) {
        if let name = Name.text , let email = Email.text {
                    if !name.isEmpty , !email.isEmpty {
                       
                        let alert = UIAlertController(title: "Are You Sure!", message: "New Student \(name) Will Be inserted Now", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            
                            let newStd = Student(name: name, email: email, imageData: self.selectedImageData)
                            self.model?.addNewStudent(newStd: newStd)
                            self.selectedImageData = UIImage(named: "empty")?.pngData()
                           
                        }))
                        
                        present(alert, animated: true)
                        Name.text = ""
                        Email.text = ""
                        userImage.image = UIKit.UIImage(named: "empty")
                  
                            
                    }else {
                        
                        let alert = UIAlertController(title: "Missing Info!", message: "You Have to enter your name and your email", preferredStyle: .actionSheet)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true)
                        
                        
                    }
                }
    }
    
    

}

