//
//  GameController.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit

class GameController {
    
    var level: Level!
    var word: String!
    var wordNumber = 0
    var guessNumber = 0
    let wordStack: UIStackView
    let targetStack: UIStackView
    var gameView: GameViewController!
    
    let color1 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
    
    init(wordStackView: UIStackView, targetStackView: UIStackView) {
        self.wordStack = wordStackView
        self.targetStack = targetStackView
    }
    
    func dealWord() {
        self.word = level.words[wordNumber]
        
        for (index, letter) in word.characters.enumerate() {
            let tile = makeTileButton(letter, tag: index)
            let target = TargetView(correctLetter: letter)

            wordStack.addArrangedSubview(tile)
            targetStack.addArrangedSubview(target)

        }

    }
    
    func makeTileButton(letter: Character, tag: Int) -> UIButton {
        let button = UIButton(type: .System)
        button.tag = tag
        button.setTitle(String(letter), forState: .Normal)
        button.backgroundColor = COLORS.tileBackground
        button.titleLabel?.textColor = COLORS.tileText
        button.addTarget(nil, action: #selector(GameViewController.tilePressed(_:)), forControlEvents: .TouchUpInside)
        return button
    }
    
    
    func guessLetter(button: UIButton!) {
        let letter = Character(button.titleLabel!.text!)
        let targets = targetStack.subviews as! [TargetView]
        
        if guessNumber < word.characters.count {
            print(guessNumber)
            print(word.characters.count)
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
        for target in targetStack.subviews as! [TargetView] {
            if !target.isMatched {
                return false
            }
        }
        return true
    }
    
    func resetWord() {
        self.guessNumber = 0
        gameView.resetButton.hidden = true
        for target in targetStack.subviews {
            target.removeFromSuperview()
        }
    }
    
    
    
    
    
    
    
    
    
}
