//
//  ViewController.swift
//  SpaceShooter0.0
//
//  Created by Iosif Dubikovski on 10/22/22.
//

import UIKit

class ViewController: UIViewController {
    let fuktion = funktion()
   
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
        present(playVC, animated: true)
        
    }
    @IBAction func settingsButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: settingsButtonView)
    }
    @IBAction func RecordsButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: recordsButtonView)
    }
    @IBAction func ExitButton(_ sender: Any) {
        fuktion.buttonPressed(senderView: exitButtonView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
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

