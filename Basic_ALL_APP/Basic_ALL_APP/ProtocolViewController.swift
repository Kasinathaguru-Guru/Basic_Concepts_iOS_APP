//
//  ProtocolViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 04/11/23.
//

import UIKit

class ProtocolViewController: UIViewController, iniit {
    
    
    func gett(text: String) {
        lbl1.text = text
        
    }
    
    
    
    
    @IBOutlet weak var lbl1: UILabel!
    
    
    @IBOutlet weak var nxtbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func nxtbtn(_ sender: Any) {
        
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let screen = storyBoard.instantiateViewController(withIdentifier: "Protocol1ViewController") as! Protocol1ViewController
        
        screen.modalTransitionStyle = .crossDissolve
        
        screen.delegate = self
        
        self.navigationController?.pushViewController(screen, animated: true)
        
        
    }
    


    
}
