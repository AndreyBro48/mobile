//
//  main.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

import Foundation

let countPlayers = 4
let size = 7
let game = Game(countPlayers:countPlayers)
game.ds = SimpleGameDataSource(size: size)
game.delegateUI = ConsoleGameDelegate()
game.startGame()
while game.theEnd == false {
    game.nextMovePlayerRandom()
}
