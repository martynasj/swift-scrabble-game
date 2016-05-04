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
    
    init(letter: Character) {

        let image = UIImage(named: "tile")
        self.letter = letter
        super.init(image: image)

        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.image = image
        
        
    }
    
    
    
}
