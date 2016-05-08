//
//  Config.swift
//  scrabble-game
//
//  Created by Martynas Jankauskas on 04/05/16.
//  Copyright © 2016 Martynas Jankauskas. All rights reserved.
//

import Foundation
import UIKit

private let screenRect = UIScreen.mainScreen().bounds


// MARK: constants

let screenWidth = screenRect.width
let screenHeight = screenRect.height
let tileMargin = 7.0 as CGFloat

// MARK: colors, images

// tuple with named keys
let COLORS = (
    tileText: UIColor(hex: "#ffffff"),
    timer: UIColor.blackColor()
)

let TILE_FONT = UIFont(name: "Verdana-Bold", size: 40.0)
let BACKGROUND_IMAGE = UIImage(named: "wood-background")
let TILE_BACKGROUND = UIImage(named: "tile")