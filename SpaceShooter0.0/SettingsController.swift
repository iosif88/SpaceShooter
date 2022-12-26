//
//  SettingsController.swift
//  SpaceShooter0.0
//
//  Created by Iosif Dubikovski on 11/21/22.
//

import UIKit
import MessageUI

class SettingsController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func remuveButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func maill(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    mail.setToRecipients(["iosifios88@gmail.com"])
                    mail.setSubject("Feedback")
                    mail.setMessageBody("<h>Hello!</h>", isHTML: true)
                    mail.setCcRecipients(["iosifios88@gmail.com"])
                    
                    present(mail, animated: true)
                }
    }
    
    @IBAction func telegram(_ sender: Any) {
        guard let number = URL(string: "https://t.me/@iosifios") else {return}
        UIApplication.shared.open(number)
    }
    @IBAction func weatsap(_ sender: Any) {
        guard let whatsasAppLink = URL(string: "whatsapp://send?text=Hello%20World&phone=375293093390") else {return}
        UIApplication.shared.open(whatsasAppLink)
    }
}

extension ViewController:MFMailComposeViewControllerDelegate{
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
           controller.dismiss(animated: true)
       }
}
