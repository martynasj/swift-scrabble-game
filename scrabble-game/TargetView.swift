//
//  TargetView.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 08/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit

class TargetView: UILabel {
    
    var isMatched = false
    var correctLetter: Character
    var userGuessLetter: Character? {
        willSet {
            if newValue == correctLetter {
                self.isMatched = true
                self.text = String(newValue!)
            } else {
                self.text = String(newValue!)
            }
        }
    }

    init(correctLetter: Character) {

        self.correctLetter = correctLetter
        
        let frame = CGRectMake(0, 0, 40, 40)
        super.init(frame: frame)
        
        self.text = nil
        self.font = TILE_FONT
        self.textAlignment = .Center
        self.adjustsFontSizeToFitWidth = true
        self.textColor = COLORS.tileText
        self.backgroundColor = UIColor.blueColor()
        
        self.heightAnchor.constraintEqualToConstant(40).active = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
