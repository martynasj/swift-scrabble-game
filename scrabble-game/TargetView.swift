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
                print("correct")
            } else {
                print("incorrect")
                self.text = String(newValue!)
            }
        }
    }

    init(correctLetter: Character) {
        self.correctLetter = correctLetter
        
        let frame = CGRectMake(0, 0, TILE_SIZE, TILE_SIZE)
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 4.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.backgroundColor = COLORS.TARGET_BACKGROUND.CGColor
        
        self.text = nil
        self.font = TILE_FONT
        self.textAlignment = .Center
        self.adjustsFontSizeToFitWidth = true
        self.textColor = COLORS.tileText
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
