//
//  LoginViewController.swift
//  app2
//
//  Created by Wafa Ghousheh on 13/11/2022.
//

import UIKit
import MobileCoreServices

class LoginViewController: UIViewController, UIApplicationDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var Hellolabel: UILabel!
    var usernam1:String = " "
    
    @IBOutlet var imgImage: UIImageView!
    var image1: UIImage!
    var imagepicker = UIImagePickerController()
    var detepicker = UIDatePicker()
    var parm = [String :Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hellolabel.text = "Hello \(usernam1)"
           
//        let images = UIImage(named: "user")!
//        let imagedata = UIImage.jpegData(images)
//        UserDefaults.standard.set(imagedata, forKey: "savedImage")
        
//        Hellolabel.text = UserDefaults.standard.value(forKey: "username1") as? String
//        UserDefaults.standard.string(forKey: "username1")
        
//        imgImage.image  = UserDefaults.standard.value(forKey: "img") as? UIImage
//        UserDefaults.standard.string(forKey: "img")
        
        let loginditalis = UserDefaults.standard.value(forKey: "img")

        if loginditalis != nil{
            imgImage.image  = UserDefaults.standard.value(forKey: "img") as? UIImage
    }
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    @IBAction func Signout(_ sender: Any) {
        
         //alert massage
                let alert = UIAlertController(title: "Logout!", message: "Are you sure you want logout", preferredStyle: .alert)
        
                let yesbutton = UIAlertAction(title: "yes", style: .default) { (action) in
            
                    let loginVC = self.storyboard?.instantiateViewController(identifier: "homepage") as! ViewController
                    self.present(loginVC, animated: true)

                }
                let nobutton = UIAlertAction(title: "no", style: .cancel, handler: nil)
              
                alert.addAction(yesbutton)
                alert.addAction(nobutton)
                present(alert,animated: true, completion: nil)
 
    }
    
    
    @IBAction func AddPhoto(_ sender: Any) {
        actionSheet()
//        UserDefaults.standard.set(self.imgImage.image,forKey: "img")
        UserDefaults.standard.set(imgImage.image, forKey: "img")
    }
    
    
    
    @IBAction func Finish(_ sender: Any) {

        let imageuser = imgImage.image
        guard let vc = self.storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController else{
            return
        }
        
        vc.img = imageuser

        self.navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        imageuser
        let dvc = segue.destination as! welcomViewController
        dvc.img = imgImage.image

    }
    
    
  
    func getphoto(type: UIImagePickerController.SourceType){
        let image = UIImagePickerController()
        image.sourceType = type
        image.allowsEditing = true
        image.delegate = self
        present(image, animated: true)
//        , completion: nil
    }
    
    // alert action sheet
    func actionSheet(){
        
        let alert = UIAlertController(title: "choose photo From: ", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (handler) in

            self.getphoto(type: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (handler) in

            self.getphoto(type: .photoLibrary)

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler : nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editPhoto(_ sender: Any) {
        self.performSegue(withIdentifier: "Loginpage", sender: nil)

//        UserDefaults.standard.set(imgImage.image, forKey: "img")
        
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage{
            imgImage.image = image
        }
         if let image = info[.editedImage] as? UIImage{
            imgImage.image = image
        }else{
            
            print("image not found")
        }
        
        self.dismiss(animated: true, completion: nil)
        
//        let islogin = UserDefaults.standard.object(forKey: "img")
//
//        if (islogin != nil) {
//           let vc =  self.storyboard?.instantiateViewController(identifier: "welcom") as! welcomViewController
//            vc.imageuser.image = imgImage.image
//
//        }
//        UserDefaults.standard.set(imgImage.image, forKey: "img")
//        UserDefaults.standard.synchronize()
        }

    // Dismiss the image if the user canceled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
   
  
    
    
    
    
    
    
    
    
    
    
    
    
}



















    
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        if segue.identifier == "welcome" {
////              let dvc = segue.destination as! LoginViewController
////              dvc.usImage1 = imageuser.image
////          }
////        let usim = imgImage.image
////        if let vc = storyboard?.instantiateViewController(identifier: "welcom") as? welcomViewController{
////
////            self.navigationController?.pushViewController(imgImage, animated: true)
////            present(usim ?? imgImage.image, animated: true)
////
//        }
    

// self.performSegue(withIdentifier: "homepage", sender: self)
//     let alerts = UIAlertController(title: "Done", message:"Successfully", preferredStyle: .alert)
 // let yesbutton = UIAlertAction(title: "yes", style: .default) { (action) in
 // alert = UIAlertController(title: "Successful", message:"Successful logout", preferredStyle: .alert)
 // self.present(alert,animated: true, completion: nil)

//        UserDefaults.standard.set(false, forKey: "Login")
//           UserDefaults.standard.synchronize()

     
             //present(loginVC, animated: true)


//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//
//        imgImage.image = image
//
//        dismiss(animated: true, completion: nil)
//    }
//
    
//        guard let image = info[.originalImage] as? UIImage else{
//            print("image not found")
//            return
//        }
//        guard let image = info[.editedImage] as? UIImage else{
//            imgImage.image = image
//            return
//        }
//        imgImage.image = image

// open gallery
//    func opengallery(){
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            let image = UIImagePickerController()
//            image.allowsEditing = true
//            image.delegate = self
//            present(image, animated: true, completion: nil)
//        }
//    }

// to open camera
//    func openCamera(){
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//
//            let image = UIImagePickerController()
//            image.allowsEditing = true
//            image.sourceType = .camera
//            image.mediaTypes = [kUTTypeImage as String]
//            self.present(image, animated: true, completion: nil)
//        }
//
//    }


//    func editPhoto(){
////        editButtonItem.image
//        let image = UIImagePickerController()
//              image.allowsEditing = true
//              image.delegate = self
//              present(image, animated: true, completion: nil)
//    }
//
//    override func setEditing(_ editing: Bool, animated: Bool) {
//
////            let image = UIImagePickerController()
////            image.allowsEditing = true
////            self.present(image, animated: true, completion: nil)
//
//        super.setEditing(editing, animated: animated)
//
//            if (editing){
//                imagepicker.isEditing = true
//            } else {
//                imagepicker.isEditing = false
//            }
//        }
 
//        if UIImagePickerController{
//            let image = UIImagePickerController()
//            image.allowsEditing = true
//            image.delegate = self
//            present(image, animated: true, completion: nil)
//
//
        
//    }
        
//        editPhoto()
