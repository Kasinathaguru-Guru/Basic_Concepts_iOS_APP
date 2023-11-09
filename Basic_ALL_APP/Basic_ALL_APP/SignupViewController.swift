    //
//  SignupViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 18/09/23.
//

import UIKit
import CoreData

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var cpass: UITextField!
    
    @IBOutlet weak var mob: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fname.placeholder = "Enter FullName"
        lname.placeholder = "Enter lastName"
        email.placeholder = "Enter Email"
        
        pass.placeholder = "Enter Password"
        pass.isSecureTextEntry = true
        

        cpass.placeholder = "Enter Confirm Password"
        cpass.isSecureTextEntry = true

        mob.keyboardType = UIKeyboardType.numberPad
        mob.delegate = self
        mob.placeholder = "Enter Mobile Number"



    }
    
    
                    // All text field validate

    
    
    func isEmpty(_ textField: UITextField) -> Bool {
        return textField.text?.isEmpty ?? true
    }

    
    
                //Email Regex method
    
    func isEmailValid(_ email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    

                // password regex method
    
    func isPasswordValid(_ password: String) -> Bool {
        
        let enteredPassword = pass.text ?? ""
       // let password: NSString = pass.text! as NSString
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&*!])[A-Za-z\\d@#$%^&*!]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }

    
    
                // pass and cpass match

        func PasswordsMatch() -> Bool {

        return pass.text == cpass.text
            
        }
    
    
                    //Mobile number 10digits allows and not allow chars
    
    func Mobilenumber(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Calculate the new text after the replacement
           let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
           
           // Check if the new text contains only digits and doesn't exceed 10 characters
           let digitCharacterSet = CharacterSet.decimalDigits
           let isNumeric = newText.rangeOfCharacter(from: digitCharacterSet.inverted) == nil
           return isNumeric && newText.count <= 10
       }
   
    
    // validate and error showing
    
    func validateForm() -> Bool {
        if isEmpty(fname) {
            displayError("FName is required")
            return false
        }
        
        
        if isEmpty(lname) {
            displayError("LName is required")
            return false
        }
        
        
        if isEmpty(email) {
            displayError("Email is required")
            return false
        }
        
        if !isEmailValid(email.text ?? "") {
            displayError("Invalid email format")
            return false
        }
        
        if isEmpty(pass) {
            displayError("Password is required")
            return false
        }
        
        
        if !isPasswordValid(pass.text ?? "") {
            displayError("Password is too weak")
            return false
        }
        
        
        if isEmpty(cpass) {
            displayError("Confirm Password is required")
            return false
        }
        
        
        if PasswordsMatch() {
            displayError("Password and Confirm Password doesn't match")
            return false
        }
        
        
        if isEmpty(mob) {
            displayError("Mobile number is required")
            return false
        }
        
//        if Mobilenumber() {
//            displayError("")
//            return false
//        }
        
        
        // All validation checks passed
        return true
    }

    func displayError(_ message: String) {
        // Implement how you want to display the error message (e.g., show a UIAlertController)
    }

    
    
    
    
    
    
    func savedata() {

        let appdel = UIApplication.shared.delegate as! AppDelegate

        let manageconducts = appdel.persistentContainer.viewContext

        let signupdata = NSEntityDescription.entity(forEntityName: "Signup", in: manageconducts)

        let obj = NSManagedObject(entity: signupdata!, insertInto: manageconducts)

       // NSManagedObjectContext()

        obj.setValue(fname.text, forKey: "fname")
        obj.setValue(lname.text, forKey: "lname")
        obj.setValue(email.text, forKey: "email")
        obj.setValue(pass, forKey: "password")
        obj.setValue(cpass, forKey: "cpassword")
        obj.setValue(mob, forKey: "mobile")


        do {

           try manageconducts.save()

        }

        catch {

            print("Error")
        }

    }

    
//    func fetchdata() {
//
//
//
//        let appdel = UIApplication.shared.delegate as! AppDelegate
//
//        let manageconducts = appdel.persistentContainer.viewContext
//
//        let signupdata = NSFetchRequest<NSFetchRequestResult>(entityName: "Signup")
//
//
//        do {
//
//            let value = try manageconducts.fetch(signupdata)
//
//            for data in value as! [NSManagedObject] {
//
//            fntxt.text = (data.value(forKey: "fname") as! String)
//            lntxt.text = (data.value(forKey: "lname") as! String)
//            mailtxt.text = (data.value(forKey: "email") as! String)
//            pastxt.text = (data.value(forKey: "password") as! String)
//            cpastxt.text = (data.value(forKey: "cpassword") as! String)
//            mobnotxt.text = (data.value(forKey: "mobile") as! String)
//
//
//        }
//    }
//
//
//
//    catch {
//
//
//        print("Error")
//
//
//    }
//}
    
    
    
    
//    func singlefetchUser() {
//        
//
//        
//        let appdel = UIApplication.shared.delegate as! AppDelegate
//        
//        let manageconducts = appdel.persistentContainer.viewContext
//        
//        let signupdata = NSFetchRequest<NSFetchRequestResult>(entityName: "Signup")
//        
//        signupdata.predicate = NSPredicate(format: "fname == %@ && lname == %@", "fname","lname")
//        
//                                                                        // predicate  --> Oru format koduthutu atha check panni validate panrathuku use panrom
//         
//        do {
//            
//            let value = try manageconducts.fetch(signupdata)
//            
//            for data in value as! [NSManagedObject] {
//            
//            fntxt.text = (data.value(forKey: "fname") as! String)
//            lntxt.text = (data.value(forKey: "lname") as! String)
//            mailtxt.text = (data.value(forKey: "email") as! String)
//            pastxt.text = (data.value(forKey: "password") as! String)
//            cpastxt.text = (data.value(forKey: "cpassword") as! String)
//            mobnotxt.text = (data.value(forKey: "mobile") as! String)
//
//            
//        }
//    }
//    
//    
//    
//    catch {
//        
//        
//        print("Error")
//        
//        
//    }
//}
    
    
    
    
//    func update() {
//
//
//            let appdel = UIApplication.shared.delegate as! AppDelegate
//
//            let manageconducts = appdel.persistentContainer.viewContext
//
//            let signupdata = NSFetchRequest<NSFetchRequestResult>(entityName:"Signup")
//
//            signupdata.predicate = NSPredicate(format: "name == %@ && email == %@", "name","email")
//
//            do {
//
//                let value = try manageconducts.fetch(signupdata)
//
//                if (value.isEmpty != true) {               // Predict la kodutha values empyty ah irunthal
//
//
//
//                    let obj = value[0] as! NSManagedObject   // object value create panni dbt
//
//                obj.setValue("kumar", forKey: "name")
//                obj.setValue("000749", forKey: "phone")      // ella obj kum new val set panrom
//                obj.setValue("28", forKey: "age")
//                obj.setValue("kumarragul71@gmail.com",forKey: "email")
//
//                let value = try manageconducts.fetch(signupdata)
//
//                for data in value as! [NSManagedObject] {
//
//                print(data.value(forKey: "name") as! String)
//
//                print(data.value(forKey: "phone"))
//
//     do {
//
//        try manageconducts.save()
//
//            }
//
//    catch {
//
//    }
//
//    }
//
//                 }
//
//    catch {
//
//    }
                 
                 
                 
                 
                 
                 
//        }
//        func deleteuser() {
//            let appdelegate = UIApplication.shared.delegate as!
//    AppDelegate
//            let managedContext =
//    appdelegate.persistentContainer.viewContext
//            let fetchReq =
//    NSFetchRequest<NSFetchRequestResult>(entityName:
//    "UserDetails")
//         //   fetchReq.predicate = NSPredicate(format: "name ==
//    %@ && email == %@", "name","email")
//            do {
//                let value = try managedContext.fetch(fetchReq)
//                if (value.isEmpty != true) {
//                    let obj = value[0] as! NSManagedObject
//                         managedContext.delete(obj)
//               //     managedContext.delete(<#T##object:
//    NSManagedObject##NSManagedObject#>)
//                    do {
//                        try managedContext.save()
//
//    } catch{
//    }
//    } }
//    catch { }
//    } }
    
    
    
    
    
    
    
    
//    @IBAction func signupbtn(_ sender: Any) {
//        
//        
//        //Storyboard connect
//        
//        let svc = storyboard?.instantiateViewController(withIdentifier: "LoginpageViewController") as! LoginpageViewController
//        
//        self.navigationController?.pushViewController(svc, animated: true)
//        
//    }
    
    
    @IBAction func signup(_ sender: Any) {
        
        
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        
        savedata()
        
        fname.text = ""
        lname.text = ""
        email.text = ""
        pass.text = ""
        cpass.text = ""
        mob.text = ""
        
        
        // Email validation with regex method
        
        let enteredEmail = email.text ?? "" //-> It denoted as emty value aga irukum
        
        if isEmailValid(enteredEmail) {
            
        } else {
            
            let alertController = UIAlertController(
                title: "Error",
                message: "Please enter a valid email address.",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
        
        
        
        
        // Password validation with regex method
        
        let enteredPassword = pass.text ?? ""   //-> It denoted as emty value aga irukum
        
        if isPasswordValid(enteredPassword) {
            
        } else {
            let alertController = UIAlertController(
                title: "Error",
                message: "Password must meet certain criteria (e.g., minimum length, uppercase, lowercase, digit, and special character).",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
        
        
        // after validate the email and password It allows to Loginpage using segue method
        
        
        if isEmailValid(enteredEmail) && isPasswordValid(enteredPassword) {
            
        }
    }
        
    
   
    
    
    }

    


