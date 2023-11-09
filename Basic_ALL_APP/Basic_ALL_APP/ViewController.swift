//
//  ViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 18/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
        
        override func viewDidAppear(_ animated: Bool) {
           movetoNextpage()
        }
        
        func movetoNextpage (){
            
            
                    let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
                    
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        if isLoggedIn {
                            
                            // Navigate to the login page
                            let loginPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginpageViewController") as! LoginpageViewController
                            
                            self.navigationController?.pushViewController(loginPageViewController, animated: true)
                            
                        }
                        
                        else {
                            // Navigate to the homepage
                            let homepageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
                            
                            self.navigationController?.pushViewController(homepageViewController, animated: true)
                        }
                    }
                }
            }

            
//            let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
//
//
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//
//                if isLoggedIn == true {
//
//                    // --> Without segue method
//
//                    let LoginpageViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginpageViewController") as! LoginpageViewController
//                    self.navigationController?.pushViewController(LoginpageViewController, animated: true)
//
//
////                   let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "LoginpageViewController")
////                   self.navigationController?.pushViewController(Storyboard, animated: true)
////                    self.present(vc1!,animated: true)
//
//                }
//
//                else {
//
//
//
//                    // --> Without segue method
//
//                    let HomepageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
//
//                   self.navigationController?.pushViewController(HomepageViewController, animated: true)
//
//
//                }
//
//            }
//    }
//
//
//}
//
//
//
//
//
