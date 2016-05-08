//
//  GameViewController.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var targetStackView: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var resetButton: UIButton!
    
    var gameController: GameController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Level: 1"
        self.resetButton.hidden = true
        
        let level1 = Level(levelNumber: 1)
        
        self.gameController = GameController(wordStackView: stackView, targetStackView: targetStackView)
        self.gameController.gameView = self
        self.gameController.level = level1
        self.gameController.dealRandomWord()
        
    }
    
    // Cannot have this button in GameController, why???
    func tilePressed(sender: UIButton!) {
        self.gameController.guessLetter(sender)
    }
    
    @IBAction func resetWord(sender: UIButton) {
        self.gameController.resetWord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
