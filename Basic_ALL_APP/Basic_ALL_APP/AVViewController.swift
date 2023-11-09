//
//  AVViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 04/11/23.
//

import UIKit
import AVFoundation

class AVViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func abtn(_ sender: Any) {
    }
    
    
    
    
    
    @IBAction func vbtn(_ sender: Any) {
        
       play()
        
    }
    
    
    
    func play() {
        
        if let videoPath = Bundle.main.path(forResource: "KGF", ofType: "mp4") {
            let videoURL = URL(fileURLWithPath: videoPath)
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = view.bounds
            view.layer.addSublayer(playerLayer)
            player.play()
            
        }
    }
    

        
    }
    
    
    
    
    
    

