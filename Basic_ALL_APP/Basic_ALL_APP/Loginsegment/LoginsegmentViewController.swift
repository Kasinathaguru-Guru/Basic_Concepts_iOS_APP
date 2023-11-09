//
//  LoginsegmentViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 05/11/23.
//

import UIKit

class LoginsegmentViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username.attributedPlaceholder = NSAttributedString(string: "UserName", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:99.0/255.0, green: 99.0/255.0, blue:102.0/255.0, alpha:0.6)])
        
        
        username.addbottomcolor(color: UIColor.lightGray, width: 0.5)
        password.addbottomcolor(color: UIColor.lightGray, width: 0.5)

        
        self.username.addpadding()
        self.password.addpadding()
        
        
    }
    

    
}

extension UIView {
    func addbottomcolor(color:UIColor, width: CGFloat ) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 25, height: width)
        self.layer.addSublayer(border)
    }
}


extension UITextField {
    func addpadding ()  {
        
        let paddingview: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftView = paddingview
        self.leftViewMode = .always
        self.leftView = paddingview
        self.rightViewMode = .always
    }
}
