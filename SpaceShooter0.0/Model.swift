//
//  Model.swift
//  SpaceShooter0.0
//
//  Created by Iosif Dubikovski on 10/22/22.
//

import Foundation
import UIKit

class funktion  {
    
    
    func buttonPressed(senderView:UIImageView) {
        senderView.alpha = 0
        
        
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { timer in
            senderView.alpha = 1
            
        }
    }
    func spaceshipStartPosition(object:UIImageView,view:UIView) -> CGRect{
        
        let positionX = ((view.frame.maxX / 2) - 50)
        let positionY = ((view.frame.maxY / 2) - 50) * 1.7

        return CGRect(x: positionX, y: positionY, width: view.frame.width / 4, height: view.frame.width / 4)
        
    }
}

