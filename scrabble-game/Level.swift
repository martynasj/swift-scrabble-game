//
//  Level.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import Foundation

struct Level {
    
    var timeToSolve: Int
    var pointsPerWord: Int
    var words: [String]
    
    init(levelNumber: Int) {
        
        let fileName = "Level\(levelNumber)"
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: ".plist") {
            if let levelDictionary = NSDictionary(contentsOfFile: path) {
                self.pointsPerWord = levelDictionary.valueForKey("pointsPerWord") as! Int
                self.timeToSolve = levelDictionary.valueForKey("timeToSolve") as! Int
                self.words = levelDictionary.valueForKey("words") as! [String]
                return
            }
        } else {
            print("file not found")
            
        }
        
        self.pointsPerWord = 0
        self.timeToSolve = 0
        self.words = ["no words"]
        
    }
    
}