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
    
    var level: Level!
    var gameView: UIView
    var tiles = [TileView]()
    var wordStack: UIStackView!
    
    let color1 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        gameView = UIView(frame: frame)
        gameView.backgroundColor = color1
    }
    
    func dealRandomWord() {
        let word = level.words[0]
        print(word)
        
        let tileSize = screenWidth * 0.9 / CGFloat(word.characters.count)
        
        for (index, letter) in word.characters.enumerate() {
            
            let rect = CGRectMake(0, 0, 50, 100)
            let label = UILabel(frame: rect)
            label.text = String(letter)
            label.backgroundColor = color1
//            let tile = TileView(letter: letter, size: tileSize)
            
//            tile.center = CGPoint( x: CGFloat(tileMargin + tileSize) * CGFloat(index), y: screenHeight / 4 )
//            gameView.addSubview(tile)
//            tiles.append(tile)
            wordStack.addArrangedSubview(label)

        }
        
//        wordStack.axis = .Horizontal
//        wordStack.spacing = 5
//        wordStack.distribution = .FillEqually
//        wordStack.alignment = .Center
//        wordStack.translatesAutoresizingMaskIntoConstraints = false
//        gameView.addSubview(wordStack)
//        
//        let viewsDictionary = ["stackView":wordStack]
//        let stackView_H = NSLayoutConstraint.constraintsWithVisualFormat(
//            "H:|-20-[stackView]-20-|",  //horizontal constraint 20 points from left and right side
//            options: NSLayoutFormatOptions(rawValue: 0),
//            metrics: nil,
//            views: viewsDictionary)
//        let stackView_V = NSLayoutConstraint.constraintsWithVisualFormat(
//            "V:|-30-[stackView]-30-|", //vertical constraint 30 points from top and bottom
//            options: NSLayoutFormatOptions(rawValue:0),
//            metrics: nil,
//            views: viewsDictionary)
//        gameView.addConstraints(stackView_H)
//        gameView.addConstraints(stackView_V)
//        gameView.addSubview(wordStack)

        
    }
    
}
