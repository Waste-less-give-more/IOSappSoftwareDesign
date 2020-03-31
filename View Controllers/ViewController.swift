//
//  ViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-10.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    var videoPlayer: AVPlayer?
    
    var videoPlayerLayer: AVPlayerLayer?
    
    var looper: AVPlayerLooper?
    
    @IBOutlet weak var orgCreateButton: UIButton!
    
    @IBOutlet weak var personalCreateButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         setUpElements()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set up video in background
        setUpVideo()
    }
    
    
    func setUpElements(){
        
        //style the elements
        
        Utilities.styleFilledButton(orgCreateButton)
        
        Utilities.styleHollowButton(personalCreateButton)
        
        
        
    }
    func setUpVideo() {
        
        //Get the path to the resource in the bundle
       let bundlePath = Bundle.main.path(forResource: "Video", ofType: "mp4")
        guard bundlePath != nil else {
            return
            
        }
        //create url from the bundle
        let url = URL(fileURLWithPath: bundlePath!)
        
        //create the video player item
        let item = AVPlayerItem(url: url)
        //create the player
       // let player = AVQueuePlayer(playerItem: item)
        let player = AVQueuePlayer()
        looper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: AVAsset(url: url)))
        
        //create the layer
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
       // self.videoPlayer!.play()
        
        //adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
            
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
            
         //add it to the view and play it
        
       // while(true){
        videoPlayer?.playImmediately(atRate: 0.3)
       // }
       
    }
    @IBAction func createOrgTapped(_ sender: Any) {
        //var tapped = true
    }
    
    
    @IBAction func createPersonalTapped(_ sender: Any) {
       // var tapped = true
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
       // var tapped = true
    }
    
}

