//
//  RegistersegmentViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 05/11/23.
//

import UIKit

class RegistersegmentViewController: UIViewController {
    
    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var cpassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fname.attributedPlaceholder = NSAttributedString(string: "FirstName", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        lname.attributedPlaceholder = NSAttributedString(string: "LastName", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        email.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        cpassword.attributedPlaceholder = NSAttributedString(string: "Confirm-Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        
        fname.addbottomcolor(color: UIColor.lightGray, width: 0.5)
        lname.addbottomcolor(color: UIColor.lightGray, width: 0.5)
        email.addbottomcolor(color: UIColor.lightGray, width: 0.5)
        password.addbottomcolor(color: UIColor.lightGray, width: 0.5)
        cpassword.addbottomcolor(color: UIColor.lightGray, width: 0.5)

        
        self.fname.addpadding1()
        self.lname.addpadding1()
        self.email.addpadding1()
        self.password.addpadding1()
        self.cpassword.addpadding1()
        
            }
}


extension UIView {
    func addbottomcolor1(color:UIColor, width: CGFloat ) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 25, height: width)
        self.layer.addSublayer(border)
    }
}


extension UITextField {
    
    func addpadding1 ()  {
        
        let paddingview: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftView = paddingview
        self.leftViewMode = .always
        self.leftView = paddingview
        self.rightViewMode = .always
    }
}
