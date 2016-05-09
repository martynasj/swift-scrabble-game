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
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var currentWordNumber: UILabel!
    @IBOutlet weak var totalWordsInLevel: UILabel!
    @IBOutlet weak var levelNumber: UILabel!
    @IBOutlet weak var tileView: UIView!
    
    var gameController: GameController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BACKGROUND_COLOR
        self.title = "Level: 1"
        self.resetButton.hidden = true
    }
    
    // If I use another lifecycle method, I get incorrect view frame sizes
    override func viewDidAppear(animated: Bool) {
        let level1 = Level(levelNumber: 1)
        self.gameController = GameController(tileView: tileView, targetStackView: targetStackView)
        self.gameController.gameView = self
        self.gameController.level = level1
        self.gameController.dealWord()
    }
    
    // Cannot have this button in GameController, why???
    func tilePressed(sender: UIButton!) {
        self.gameController.guessLetter(sender)
    }
    
    @IBAction func resetWord(sender: UIButton) {
        self.gameController.resetWord()
        self.gameController.dealWord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skipWord(sender: UIButton) {
    }

    
    // MARK: - Navigation
    
    @IBAction func backToMenu(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
