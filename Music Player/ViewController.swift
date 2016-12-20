//
//  ViewController.swift
//  Music Screen
//
//  Created by admin on 20/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InteractivePlayerViewDelegate {
    
    
    @IBOutlet weak var blurBgImage: UIImageView!
    
    @IBOutlet weak var shuffle: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ipv: InteractivePlayerView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playPauseButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.layoutIfNeeded()
        self.view.backgroundColor = UIColor.clear
        self.makeItRounded(view: self.playPauseButtonView, newSize: self.playPauseButtonView.frame.width)

        self.ipv!.delegate = self
        
        // duration of music
        self.ipv.progress = 20.0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override var prefersStatusBarHidden: Bool
    {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        self.ipv.start()
        
        self.playButton.isHidden = true
        self.pauseButton.isHidden = false
        
    }

    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        
        self.ipv.stop()
        
        self.playButton.isHidden = false
        self.pauseButton.isHidden = true
        
    }
    
    @IBAction func rankingButtonTapped(_ sender: Any) {
        
        showSimpleAlert(title: "Ranking Button Tapped", message: "Temeperorily this button is disabled, its functionality is to present stars for ranking the song")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        showSimpleAlert(title: "Back Button Tapped", message: "In real time by pressing this button previous folder will be displayed")
    }
    @IBAction func nextTapped(sender: AnyObject) {
        self.shuffle.image = UIImage(named: "shuffle")
        self.likeImage.image = UIImage(named: "like_unselected")
    }
    
    @IBAction func previousTapped(sender: AnyObject) {
          self.likeImage.image = UIImage(named: "like_selected")
        self.shuffle.image = UIImage(named: "shuffle_unselected")
        
       
    }
    
    /* InteractivePlayerViewDelegate METHODS */
    func actionOneButtonTapped(sender: UIButton, isSelected: Bool) {
        print("shuffle \(isSelected.description)")
    }
    
    func actionTwoButtonTapped(sender: UIButton, isSelected: Bool) {
        print("like \(isSelected.description)")
    }
    
    func actionThreeButtonTapped(sender: UIButton, isSelected: Bool) {
        print("replay \(isSelected.description)")

    }
    
    func interactivePlayerViewDidChangedDuration(playerInteractive: InteractivePlayerView, currentDuration: Double) {
        print("current Duration : \(currentDuration)")
    }
    
    func interactivePlayerViewDidStartPlaying(playerInteractive: InteractivePlayerView) {
        print("interactive player did started")
    }
    
    func interactivePlayerViewDidStopPlaying(playerInteractive: InteractivePlayerView) {
        print("interactive player did stop")
    }
    
    func makeItRounded(view : UIView!, newSize : CGFloat!){
        let saveCenter : CGPoint = view.center
        let newFrame : CGRect = CGRect(x: view.frame.origin.x,y: view.frame.origin.y,width: newSize,height : newSize)
        view.frame = newFrame
        view.layer.cornerRadius = newSize / 2.0
        view.clipsToBounds = true
        view.center = saveCenter
        
    }
    
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style:  .default,
            handler: nil
        )
        alert.addAction(okAction)
        present(
            alert,
            animated: true,
            completion: nil
        )
    }

}
