//
//  ViewController.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 02/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: variables
    var nounlist = [String]()
    var shuffledNounList = [String]()
    var gameOver = false {
        willSet {
            if newValue == true {
                endGame()
            }
        }
    }
    var originalWord = ""
    var shuffledWord = ""
    var userGuess = ""
    var score = 0 {
        didSet {
            scoreBarButton.title = "Score: \(score)"
        }
    }
    var lives = 5 {
        didSet {
            livesBarButton.title = "Lives: \(lives)"
            if lives == 0 {
                gameOver = true
            }
        }
    }

    // MARK: outlets
    
    @IBOutlet weak var shuffledWordLabel: UILabel!
    @IBOutlet weak var originalWordLabel: UILabel!
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var scoreBarButton: UIBarButtonItem!
    
    @IBOutlet weak var livesBarButton: UIBarButtonItem!
    
    // MARK: actions
    
    @IBAction func getNextWord(sender: UIButton) {
        lives -= 1
        showNextWord()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Game"
        
        scoreBarButton.title = "Score: \(score)"
        livesBarButton.title = "Lives: \(lives)"
        
        initNounList()
        
        wordInput.delegate = self
        startNewGame()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField.text != nil) {
            guessWord(textField.text!)
            return true
        } else {
            print("Make a guess")
            return false
        }
    }
    
    func guessWord(word: String) {
        if word == originalWord {
            score += 1
            showNextWord()
        }
    }
    
    func endGame() {
        let ac = UIAlertController(title: "Game Over", message: "Your score: \(score)", preferredStyle: .Alert)
        let restartGame = UIAlertAction(title: "Play again", style: .Default) {
            action in
            self.startNewGame()
        }
        ac.addAction(restartGame)
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func initNounList() {
        if let nounlistPath = NSBundle.mainBundle().pathForResource("nounlist", ofType: ".txt") {
            if let longString = try? String(contentsOfFile: nounlistPath) {
                nounlist = longString.componentsSeparatedByString("\n")
                shuffledNounList = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(nounlist) as! [String]
            }
        }
    }
    
    func startNewGame() {
        lives = 5
        score = 0
        showNextWord()
    }
    
    func showNextWord() {
        
        if let randomWord = shuffledNounList.popLast() {
            originalWord = randomWord
            originalWordLabel.text = randomWord
            
            let characters = randomWord.characters.map {
                char -> String in
                return String(char)
            }
                
            let shuffledCharacters = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(characters) as! [String]
            shuffledWordLabel.text = shuffledCharacters.joinWithSeparator("")
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

