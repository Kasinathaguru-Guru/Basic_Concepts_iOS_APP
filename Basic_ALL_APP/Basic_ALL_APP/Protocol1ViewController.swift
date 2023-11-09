//
//  Protocol1ViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 04/11/23.
//

import UIKit


protocol iniit {
    
    func gett(text: String)
    
}

class Protocol1ViewController: UIViewController {
    
    
    var delegate: iniit?
    
    
    
    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var bacbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func bacbtn(_ sender: Any) {
        
        
        delegate?.gett(text: txt.text!)
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
