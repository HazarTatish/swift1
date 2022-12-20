//
//  ViewController.swift
//  app2
//
//  Created by Wafa Ghousheh on 13/11/2022.
//

import UIKit
import Foundation
import SwiftUI

      


class ViewController: UIViewController, UITextFieldDelegate{

    

    @IBOutlet var validemail: UILabel!
    @IBOutlet var validuserName: UILabel!
    @IBOutlet var validpassword: UILabel!
    
    @IBOutlet var passwordlabel: UILabel!
    @IBOutlet var emaillabel: UILabel!
    @IBOutlet var usernamelabel: UILabel!
    
    @IBOutlet var passwordtext: UITextField!
    @IBOutlet var emailtext: UITextField!
    @IBOutlet var usernametext: UITextField!
    
    @IBOutlet var registerbutten: UIButton!
   
    
    let userdefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
//        userdefaults.removeObject(forKey: "email")
//        userdefaults.removeObject(forKey: "username")
//        userdefaults.removeObject(forKey: "password")

    
        restForm()

        usernametext.delegate = self
        emailtext.delegate = self
        passwordtext.delegate = self
 
        usernametext.addTarget(self, action: #selector(usernamechange(_:)), for: .editingChanged)
        emailtext.addTarget(self, action: #selector(emailChange(_:)), for: .editingChanged)
        passwordtext.addTarget(self, action: #selector(passwordChange(_:)), for: .editingChanged)
        
        
        
        let loginditalis = UserDefaults.standard.string(forKey: "username")

        if loginditalis != nil{
            usernametext.text = UserDefaults.standard.value(forKey: "username") as? String
            passwordtext.text = UserDefaults.standard.value(forKey: "password") as? String
            emailtext.text = UserDefaults.standard.value(forKey: "email") as? String

           }
    }

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           print("TextField did begin editing method called")
    }
        func textFieldDidEndEditing(_ textField: UITextField) {
            print("TextField did end editing method called \(textField.text!)")
        }
    
    // next enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernametext{
            emailtext.text
            emailtext.becomeFirstResponder()
            //print("\(usernametext.text)")
        }
        
        else if textField == emailtext{
            
            passwordtext.becomeFirstResponder()
        }
        
        else{
        
            view.endEditing(true)
        }
                
        return true
    }

    func restForm(){
        registerbutten.isEnabled = true
        
        
        validemail.isHidden = false
        validuserName.isHidden = false
        validpassword.isHidden = false
        
        
        validuserName.text = "Required"
        validemail.text = "Required"
        validpassword.text = "Required"
        
        emailtext.text = ""
        usernametext.text = ""
        passwordtext.text = ""
        
    }
    
       // validuserName.isHidden = true

    // forget password
    
    @IBAction func Forrget_Password(_ sender: Any) {
      

//        let forgotPassword = UIAlertController(title: "Forgot Password?", message: "Enter your email address", preferredStyle: .alert)
//        forgotPassword.addTextField { (textField) in
//                textField.placeholder = "Enter your email address"
//            }
//        forgotPassword.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
//        forgotPassword.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
//               let resetEmail = forgotPassword.textFields?.first?.text
//               Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
//                   if error != nil{
//                       let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
//                       resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                       self.present(resetFailedAlert, animated: true, completion: nil)
//                   }else {
//                       let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
//                       resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                       self.present(resetEmailSentAlert, animated: true, completion: nil)
//                   }
//               })
//           }))
//
    }
    
    
    
    //login butten
    @IBAction func login(_ sender: Any) {
        
        let userdefaults = UserDefaults.standard
        
        
        if emailtext.text == userdefaults.string(forKey: "email") && passwordtext.text == userdefaults.string(forKey: "password") && usernametext.text == userdefaults.string(forKey: "username"){
            validemail.isHidden = true
            validpassword.isHidden = true
            validuserName.isHidden = true
            
            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
            
           let datauser = usernametext.text
            guard let vc = self.storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController else{ return }
          
//             guard let vc1 = self.storyboard?.instantiateViewController(identifier: "Loginpage") as? LoginViewController else{
//                 return
//             }
//             let imgdata = vc1.imgImage.image
//             let saveimage = vc.imageuser.image
//
//             vc.img = imgdata!
//             vc1.image1 = saveimage!
//            vc.usernamewelcome = datauser!
            
           vc.usernamewelcome = datauser!
           self.navigationController?.pushViewController(vc, animated: true)
           present(vc, animated: true)
        
       }
        else if let text = emailtext.text, text.isEmpty {
        if usernametext.text == userdefaults.string(forKey: "username") && passwordtext.text == userdefaults.string(forKey: "password") {
            validemail.isHidden = true
            validpassword.isHidden = true
            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
//          passData
            let datauser = usernametext.text
            guard let vc = self.storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController else{ return }
           
//             guard let vc1 = self.storyboard?.instantiateViewController(identifier: "Loginpage") as? LoginViewController else{
//                 return
//             }
//             let imgdata = vc1.imgImage.image
//             let saveimage = vc.imageuser.image
//
//             vc.img = imgdata!
//             vc1.image1 = saveimage!
//            vc.usernamewelcome = datauser!

         vc.usernamewelcome = datauser!
         self.navigationController?.pushViewController(vc, animated: true)
         present(vc, animated: true)
            return
            
        }
        else{
            let alert = UIAlertController(title: "Error", message:" your username or passwoed wrong ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
        }
        
        else if let text = usernametext.text, text.isEmpty {
         if emailtext.text == userdefaults.string(forKey: "email") && passwordtext.text == userdefaults.string(forKey: "password"){
             validuserName.isHidden = true
             validpassword.isHidden = true
             UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
             UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
             
            let datauser = usernametext.text
            guard let vc = self.storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController else{ return }
          
//             guard let vc1 = self.storyboard?.instantiateViewController(identifier: "Loginpage") as? LoginViewController else{
//                 return
//             }
////             UserDefaults.standard.set(vc1.imgImage.image,forKey: "img")
////             UserDefaults.standard.set(vc.imageuser.image,forKey: "img")
//
//             let imgdata = vc1.imgImage.image
//             let saveimage = vc.imageuser.image
             
//             vc.img = imgdata!
//             vc1.image1 = saveimage!
            vc.usernamewelcome = datauser!
            self.navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true)
         
        }

        else{
            let alert = UIAlertController(title: "Error", message:" your email or password wrong ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
        }
        else{
            let alert = UIAlertController(title: "Error", message:" wrong data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
   

    }
    
    
    // register
    @IBAction func register(_ sender: Any) {
       
        if let textusername = self.usernametext.text, textusername.isEmpty{
            let alert = UIAlertController(title: "Error", message:"Enter your username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
         if let username = usernametext.text
                    ,let errormassage = invaliduserName(username){
                let alert = UIAlertController(title: "Error", message:"invalid username", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
                return
                
            }
        if let textEmail = self.emailtext.text, textEmail.isEmpty{
            let alert = UIAlertController(title: "Error", message:"Enter your Email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
        if let email = emailtext.text
                    ,let errormassage = invalidEmail(email){
                let alert = UIAlertController(title: "Error", message:"invalid email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
                return
                
            }
            
        if let textpassword = self.passwordtext.text, textpassword.isEmpty{
            let alert = UIAlertController(title: "Error", message:"Enter your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            return
        }
         if let password = passwordtext.text
                    ,let errormassage = inlvalidPassword(password){
                let alert = UIAlertController(title: "Error", message:"invalid password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
            return
            
        }
        
        else {
           // save user data
            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
            

            let data = usernametext.text
            guard let vc = self.storyboard?.instantiateViewController(identifier: "Loginpage") as? LoginViewController else{
                    return
                }
            vc.usernam1 = data!
            self.navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true)
            }
     
          }

    // to check valed email input
    @IBAction func emailChange(_ sender: Any) {
        
        if let email = emailtext.text{
            if let errormassage = invalidEmail(email){
                
                validemail.text = errormassage
                validemail.isHidden = false
            }
          
            else{
                validemail.isHidden = true
        }
           }

        checkForValid()
       
    }
    
    func invalidEmail(_ value: String) -> String? {
        
        if value.isEmpty{
           return "Required"
        }

        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        if !predicate.evaluate(with: value){
          return "invalid email address"
        }

        return nil
        
    }
    
        // to check valed username input
    @IBAction func usernamechange(_ sender: Any) {
        
       if let username = usernametext.text {

           if let errormassage = invaliduserName(username){

               validuserName.text = errormassage
               validuserName.isHidden = false

           }
           else{
               validuserName.isHidden = true
           }

        }
        checkForValid()
    }
    
    
    func invaliduserName(_ value: String) -> String? {
        
        if value.isEmpty{
            return "Required"
        }
        
        let regularExpression = "[A-Z0-9a-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        if !predicate.evaluate(with: value){
            return "invalid username"
        }
        
        return nil
    }
   

    // to check valed password input
    @IBAction func passwordChange(_ sender: Any) {
        
        if let passwrord = passwordtext.text{
            if let errormassage = inlvalidPassword(passwrord){
                
                validpassword.text = errormassage
                validpassword.isHidden = false
            }
            else{
                validpassword.isHidden = true
            }
        }

        checkForValid()
    }
    
    func inlvalidPassword (_ value: String) -> String?{

        if value.isEmpty{
            return "Required"
        }
        if value.count < 8 {
            return "password must be at least 8 charaters"
        }

        if containDigite(value)
        {
            return "password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "password must contain at least 1 lowercase charecter"
        }
        if containsUpperCase(value)
        {
            return "password must contain at least 1 Uppercase charecter"
        }
     
        return nil
    }

    func containDigite(_ value: String) -> Bool
    {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return !predicate.evaluate(with: value)
    }
    // lowercase letter
    func containsLowerCase(_ value: String) -> Bool
    {
        let regularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return !predicate.evaluate(with: value)
    }
    // uppercase letter
    func containsUpperCase(_ value: String) -> Bool
    {
        let regularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return !predicate.evaluate(with: value)
    }
 
    
    //check...
    func checkForValid(){
        if validemail.isHidden && validpassword.isHidden && validuserName.isHidden{
            registerbutten.isEnabled = true
            
        }

    }
       
    // keyboaarde
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
  
}
























































//        if let textusername = self.usernametext.text, textusername.isEmpty{
//            let alert = UIAlertController(title: "Error", message:"Enter your username", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//            present(alert,animated: true, completion: nil)
//
//            return
//
//        }
//
//        if let username = usernametext.text, let errormassage = invaliduserName(username){
//                let alert = UIAlertController(title: "Error", message:"invalid username", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//                present(alert,animated: true, completion: nil)
//                return
//            }
//
//        if let textEmail = self.emailtext.text, textEmail.isEmpty{
//            let alert = UIAlertController(title: "Error", message:"Enter your Email", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//            present(alert,animated: true, completion: nil)
//            return
//        }
//        if let email = emailtext.text, let errormassage = invalidEmail(email){
//                let alert = UIAlertController(title: "Error", message:"invalid email", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//                present(alert,animated: true, completion: nil)
//                return
//            }
//
//        if let textpassword = self.passwordtext.text, textpassword.isEmpty{
//            let alert = UIAlertController(title: "Error", message:"Enter your password", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//            present(alert,animated: true, completion: nil)
//            return
//        }
//         if let password = passwordtext.text
//                    ,let errormassage = inlvalidPassword(password){
//                let alert = UIAlertController(title: "Error", message:"invalid password", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//                present(alert,animated: true, completion: nil)
//            return
//
//        }

//if usernametext.text == userdefaults.string(forKey: "username") || emailtext.text == userdefaults.string(forKey: "email") {
////            let alert = UIAlertController(title: "Alert", message:"Successfully Login", preferredStyle: .alert)
////            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
//            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
//
////            present(alert,animated: true, completion: nil)
//            return
//       }
//
//        if passwordtext.text == userdefaults.string(forKey: "password"){
////            let alert = UIAlertController(title: "Alert", message:"Successfully Login", preferredStyle: .alert)
////              alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
////              present(alert,animated: true, completion: nil)
//            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
//            return
//        }
//
//       else{
//           let alert = UIAlertController(title: "Error", message:"password is wrong", preferredStyle: .alert)
//           alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//           present(alert,animated: true, completion: nil)
//           return
//       }




//        if usernametext.text == userdefaults.string(forKey: "username") && passwordtext.text == userdefaults.string(forKey: "password"){
////            let alert = UIAlertController(title: "Alert", message:"Successfully Login", preferredStyle: .alert)
////            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
////            present(alert,animated: true, completion: nil)
//
//            // pass data
//            let datauser = usernametext.text
//            guard let vc = self.storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController else{
//
//                            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
//                            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
////                            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
//                return
//                }
//
//            vc.usernamewelcome = datauser!
//            self.navigationController?.pushViewController(vc, animated: true)
//            present(vc, animated: true)
//
//        }



// to hide the error when the user edit text
//        if emailtext.isEditing{
//            return nil
//        }
//

//    func checkisempty(){
//        if usernametext.text == nil &&  emailtext.text == nil && passwordtext.text == nil{
//
//            validuserName.isHidden = true
//            validemail.isHidden = true
//            validpassword.isHidden = true
//        }
//        else{
//            validuserName.isHidden = false
//            validemail.isHidden = false
//            validpassword.isHidden = false
//        }
//    }

// hide the register button
//        else{
//            registerbutten.isEnabled = false
//        }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "Loginpage"{
//
//
//            let desVC = segue.destination as! LoginViewController
//            desVC.usernam1 = "Hello, \(usernametext.text!)"
//
//   }
//    }

//        else{
//login
//        guard let up = storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController
//
//        else{
//
//            return
//        }
//
//
//        present(up, animated: true)
//        }

     // alert massage
//            let alert = UIAlertController(title: "saving information", message: "Do you want to save information", preferredStyle: .alert)
//
//            let yesbutton = UIAlertAction(title: "yes", style: .default) { (action) in
//
//            self.performSegue(withIdentifier: "homepage", sender: self)
//                }
//
//            let nobutton = UIAlertAction(title: "no", style: .default) { (action) in
//               print("you did not save your information")
//                self.performSegue(withIdentifier: "homepage", sender: self)
//                }
//                alert.addAction(yesbutton)
//                alert.addAction(nobutton)
//                present(alert,animated: true, completion: nil)


//            guard let up = storyboard?.instantiateViewController(identifier: "Loginpage") as? LoginViewController
//            else{
//                return
//            }
//            present(up, animated: true)


//validdata.isHidden = true
//
//guard let email = emailtext.text, emailtext.text?.characters.count != 0
//else{
//    validdata.isHidden = false
//    validdata.text = "please enter your email"
//
//    return



// alert massage
//        let alert = UIAlertController(title: "saving information", message: "Do you want to save information", preferredStyle: .alert)
//
//        let yesbutton = UIAlertAction(title: "yes", style: .default) { (action) in
//            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
//            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
//            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
//            self.performSegue(withIdentifier: "homepage", sender: self)
//        }
//
//        let nobutton = UIAlertAction(title: "no", style: .default) { (action) in
//           print("you did not save your information")
//            self.performSegue(withIdentifier: "homepage", sender: self)
//        }
//        alert.addAction(yesbutton)
//        alert.addAction(nobutton)
//        present(alert,animated: true, completion: nil)


//        // to save data
//        let loginditalis = UserDefaults.standard.value(forKey: "username")
//        if loginditalis != nil{
//            usernametext.text = UserDefaults.standard.value(forKey: "username") as? String
//            passwordtext.text = UserDefaults.standard.value(forKey: "password") as? String
//            emailtext.text = UserDefaults.standard.value(forKey: "email") as? String

//        }


//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("TextField did begin editing method called")
//
//        if let username = usernametext.text {
//
//            if let errormassage = invaliduserName(username){
//
//                validuserName.text = errormassage
//                validuserName.isHidden = false
//
//            }
//            else{
//                validuserName.isHidden = true
//            }
//        }
//    }
//
//    func showAlertview(){
//
//        let alert = UIAlertController(title: "Error", message:"", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
//
//        present(alert,animated: true, completion: nil)
//
//}

// to save data
//            UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
//            UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
//            UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
//            self.performSegue(withIdentifier: "homepage", sender: self)
//            let loginditalis = UserDefaults.standard.value(forKey: "username")
//            if loginditalis != nil{
//                usernametext.text = UserDefaults.standard.value(forKey: "username") as? String
//                passwordtext.text = UserDefaults.standard.value(forKey: "password") as? String
//                emailtext.text = UserDefaults.standard.value(forKey: "email") as? String

//}


//                    UserDefaults.standard.set(self.usernametext.text!,forKey: "username")
//                    UserDefaults.standard.set(self.passwordtext.text!, forKey: "password")
//                    UserDefaults.standard.set(self.emailtext.text!, forKey: "email")
