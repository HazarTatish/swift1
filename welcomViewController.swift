//
//  welcomViewController.swift
//  app2
//
//  Created by Wafa Ghousheh on 24/11/2022.
//

import UIKit

class welcomViewController: UIViewController, UIApplicationDelegate, UITextFieldDelegate {

    @IBOutlet var welcomeuser: UILabel!
    var usernamewelcome : String = " "
    
    @IBOutlet var imageuser: UIImageView!
    
    var img : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeuser.text = "welcome \(usernamewelcome)"
        imageuser.image = img
        
        self.imageuser = UserDefaults.standard.value(forKey: "image") as? UIImageView
        UserDefaults.standard.value(forKey: "image")
    }


}





