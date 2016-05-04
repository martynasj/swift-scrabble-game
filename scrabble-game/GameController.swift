//
//  GameController.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import Foundation
import UIKit

class GameController {
    
    var level: Level? = nil
    var gameView: UIView
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        gameView = UIView(frame: frame)
        gameView.backgroundColor = UIColor(patternImage: UIImage(named: "wood-background.jpg")!)
        
    }
    
    func dealRandomWord() {
        
    }
    
}
