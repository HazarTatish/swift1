//
//  passwordrecoveryViewController.swift
//  app2
//
//  Created by Wafa Ghousheh on 15/12/2022.
//

import UIKit
import Foundation




class passwordrecoveryViewController: UIViewController {

    @IBOutlet var textenter: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func recoverpassword(_ sender: Any) {
        let useremail = textenter.text
   
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
