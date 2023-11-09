//
//  LoginpageViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 18/09/23.
//

import UIKit

class LoginpageViewController: UIViewController {
    
    
    
    
//    @IBOutlet weak var hdlbl: UILabel!
//
//    @IBOutlet weak var emaillbl: UILabel!
//
//    @IBOutlet weak var passlbl: UILabel!
//
//    @IBOutlet weak var mailtxt: UITextField!
//
//    @IBOutlet weak var passtxt: UITextField!
//
//    @IBOutlet weak var loginbtn: UIButton!
//
//    @IBOutlet weak var donthavlbl: UILabel!
//
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    @IBOutlet weak var Login: UIView!
    
    @IBOutlet weak var Register: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Assuming your segmentedControl variable is the reference to your UISegmentedControl
        
        
        let customColor = UIColor.white  // -->  Replace with your desired text color

        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: customColor], for: .normal)

        
        self.view.bringSubviewToFront(Login)
        
        // bottom Attribute text
        
  //      donthavlbl.text = "Don't have an account Clickhere" // --> Ithu enna text lbl la varanumnu
        
//        let txxt = (donthavlbl.text!)    // --> above text ku oru variable create
//        let attributedText = NSMutableAttributedString(string: txxt)  // -->
//        let txt1 = (txxt as NSString).range(of: "Clickhere")
//        attributedText.addAttribute(.foregroundColor, value: UIColor.blue, range: txt1)
//
//        donthavlbl.attributedText = attributedText
        
        
    }
    
    
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0 :
            
            self.view.bringSubviewToFront(Login)
            
        case 1 :
            
            self.view.bringSubviewToFront(Register)

            
        default:
            break
        }
        
        
    }
    
    
    //Email Regex method
    
//    func isEmailValid(_ email: String) -> Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
//        return emailTest.evaluate(with: email)
//    }
    
    
    
    //Password Regex method

//    func isPasswordValid(_ password: String) -> Bool {
//        // Define your password criteria here
//        // For example, check for minimum length, uppercase, lowercase, digit, and special character
//        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&*!])[A-Za-z\\d@#$%^&*!]{8,}$"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return passwordTest.evaluate(with: password)
//    }
    
    
//    @IBAction func loginbten(_ sender: Any) {
//
//
//        // Email validation with regex method
//
//        let enteredEmail = mailtxt.text ?? "" //-> It denoted as emty value aga irukum
//
//        if isEmailValid(enteredEmail) {
//
//        } else {
//
//            let alertController = UIAlertController(
//                title: "Error",
//                message: "Please enter a valid email address.",
//                preferredStyle: .alert
//            )
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alertController, animated: true, completion: nil)
       // }
        
        
        
        
        
        // Password validation with regex method
        
//        let enteredPassword = passtxt.text ?? ""   //-> It denoted as emty value aga irukum
//
//        if isPasswordValid(enteredPassword) {
//
//        } else {
//            let alertController = UIAlertController(
//                title: "Error",
//                message: "Password must meet certain criteria (e.g., minimum length, uppercase, lowercase, digit, and special character).",
//                preferredStyle: .alert
//            )
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alertController, animated: true, completion: nil)
//        }
//
//
//
//        // after validate the email and password It allows to homepage using segue method
//
//
//        if isEmailValid(enteredEmail) && isPasswordValid(enteredPassword) {
//
//            self.performSegue(withIdentifier: "logintohome1", sender: HomepageViewController.self)
//
//        }
//    }
    
}
