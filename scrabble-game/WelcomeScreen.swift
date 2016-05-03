//
//  WelcomeScreen.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 02/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import UIKit

class WelcomeScreen: UIViewController {

    // MARK: Actions
    @IBAction func newGame(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Welcome"
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
