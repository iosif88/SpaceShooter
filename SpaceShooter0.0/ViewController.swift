//
//  ViewController.swift
//  SpaceShooter0.0
//
//  Created by Iosif Dubikovski on 10/22/22.
//

import UIKit

class ViewController: UIViewController {
    let fuktion = function()
   
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var exitButtonView: UIImageView!
    @IBOutlet weak var recordsButtonView: UIImageView!
    @IBOutlet weak var playButtonView: UIImageView!
    @IBOutlet weak var labelTapToPlay: UILabel!
    @IBOutlet weak var settingsButtonView: UIImageView!
    @IBAction func playButton(_ sender: Any) {
        
        fuktion.buttonPressed(senderView: playButtonView)
        
        let playVC = storyboard?.instantiateViewController(withIdentifier: "game_vc") as! GameViewController
        playVC.modalPresentationStyle = .fullScreen
        present(playVC, animated: false)
        
    }
    @IBAction func settingsButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: settingsButtonView)
        
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: "setting_vc") as! SettingsController
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: false)
    }
    
    @IBAction func RecordsButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: recordsButtonView)
        
        let recordsVC = storyboard?.instantiateViewController(withIdentifier: "recordsVC") as! ThourviewController
        recordsVC.modalPresentationStyle = .fullScreen
        present(recordsVC, animated: false)
        
        
    }
    @IBAction func ExitButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: exitButtonView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //playSound()
        playMusic()
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: "setting_vc") as! SettingsController
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: false)
        
    }

    func addLabel(label:UILabel) {
       
        
        guard let customFont = UIFont(name: "Bbbbloxat", size: 20) else {return}
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        
        
    
    }
    func scriptFont(size: CGFloat)  {
     
       
     
    }
}

