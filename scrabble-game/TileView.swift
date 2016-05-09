//
//  TileView.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit
import Foundation

class TileView: UILabel {
    
    var letter: Character
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(letter: Character) {
        self.letter = letter
        
        let frame = CGRectMake(0, 0, 0, 0)
        super.init(frame: frame)
        
        self.heightAnchor.constraintEqualToConstant(40.0).active = true
        
        self.text = String(letter)
        self.font = TILE_FONT
        self.textAlignment = .Center
        self.adjustsFontSizeToFitWidth = true
        self.textColor = COLORS.tileText
        self.backgroundColor = COLORS.tileBackground
        
    }
    
    
}
