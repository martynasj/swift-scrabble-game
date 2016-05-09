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
var CONTAINER_WIDTH: CGFloat!
var CONTAINER_HEIGHT: CGFloat!
var TILE_SIZE: CGFloat!
let TILE_MARGIN = 12.0 as CGFloat

// MARK: colors, images

// tuple with named keys
let COLORS = (
    tileText: UIColor(hex: "#ffffff"),
    timer: UIColor.blackColor(),
    tileBackground: UIColor(patternImage: UIImage(named: "tile")!),
    TARGET_BACKGROUND: UIColor(hex: "#33001a")
)

let TILE_FONT = UIFont(name: "Verdana-Bold", size: 40.0)
let BACKGROUND_COLOR = UIColor(patternImage: UIImage(named: "wood-background")!)
let TILE_BACKGROUND = UIImage(named: "tile")