//
//  GameController.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit
import GameplayKit

class GameController {
    
    var level: Level!
    var word: String!
    var wordNumber = 0
    var guessNumber = 0
    let tileView: UIView
    let targetView: UIView
    var gameView: GameViewController!
    
    let color1 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
    
    init(tileView: UIView, targetView: UIView) {
        self.tileView = tileView
        self.targetView = targetView
        
        // Set config constants
        CONTAINER_WIDTH = tileView.frame.size.width
        CONTAINER_HEIGHT = tileView.frame.size.height
    }
    
    func dealWord() {
        self.word = level.words[wordNumber].uppercaseString
        
        // Update constants
        TILE_SIZE = (CONTAINER_WIDTH - CGFloat(word.characters.count - 1) * TILE_MARGIN) / CGFloat(word.characters.count)
        
        
        let wordLetterArray = self.word.characters.map { (letter) -> String in return String(letter) }

        let shuffledWord = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(wordLetterArray) as! [String]
        
        for (index, letter) in word.characters.enumerate() {
            let target = TargetView(correctLetter: letter)
            target.center = calculateCenter(index)
            
            targetView.addSubview(target)
        }
        
        for (index, letter) in shuffledWord.enumerate() {
            print(letter)
            let tile = makeTileButton(letter, index: index)
            tile.center = calculateCenter(index)
            tileView.addSubview(tile)
        }

    }
    
    func makeTileButton(letter: String, index: Int) -> UIButton {
        let button = UIButton(type: .System)
        
        button.frame = CGRectMake(0, 0, TILE_SIZE, TILE_SIZE)
        
        button.layer.cornerRadius = 10.0
        
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.blackColor().CGColor
        
        button.setTitleColor(COLORS.tileText, forState: .Normal)
        button.titleLabel!.font = TILE_FONT
            
//        button.tag = index
        button.setTitle(String(letter).uppercaseString, forState: .Normal)
        button.backgroundColor = COLORS.tileBackground
        button.addTarget(nil, action: #selector(GameViewController.tilePressed(_:)), forControlEvents: .TouchUpInside)
        return button
    }
    
    func calculateCenter(index: Int) -> CGPoint {
        let firstOffset = TILE_SIZE / 2
        let tileOffset = CGFloat(index) * (TILE_SIZE + TILE_MARGIN) + firstOffset
        
        let yOffset = CONTAINER_HEIGHT / 2
    
        return CGPoint(x: tileOffset, y: yOffset)
    }
    
    
    func guessLetter(button: UIButton!) {
        let letter = Character(button.titleLabel!.text!)
        let targets = targetView.subviews as! [TargetView]
        
        if guessNumber < word.characters.count {
            targets[guessNumber].userGuessLetter = letter
            button.removeFromSuperview()
            guessNumber += 1
        }
        
        // Last guess, check win
        if guessNumber == word.characters.count {
            if isWin() {
                wordNumber += 1
                resetWord()
                dealWord()
            } else {
                gameView.resetButton.hidden = false
            }
        }
        
    }
    
    func isWin() -> Bool {
        for target in targetView.subviews as! [TargetView] {
            if !target.isMatched {
                return false
            }
        }
        return true
    }
    
    func resetWord() {
        self.guessNumber = 0
        gameView.resetButton.hidden = true
        for target in targetView.subviews {
            target.removeFromSuperview()
        }
    }
    
    
    
    
    
    
    
    
    
}
