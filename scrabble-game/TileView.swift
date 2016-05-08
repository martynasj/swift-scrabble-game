//
//  TileView.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit

class TileView: UIImageView {
    
    var letter: Character
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(letter: Character, size: CGFloat) {

        let image = UIImage(named: "tile")
        self.letter = letter
        super.init(image: image)

        self.frame = CGRect(x: 100, y: 100, width: size, height: size)
        self.image = image
        
        // Children of this view will not be visible outside the frame
//        self.clipsToBounds = true
        
        let labelFrame = CGRect(x: 0, y: 0, width: size, height: size)
        let labelView = UILabel(frame: labelFrame)
        labelView.text = String(self.letter)
        labelView.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        labelView.textAlignment = .Center
        labelView.adjustsFontSizeToFitWidth = true
        self.addSubview(labelView)
        
    }
    
    
    
}
