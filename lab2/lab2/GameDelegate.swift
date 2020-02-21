//
//  GameDelegate.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func didStartGame(game:Game)
    func didStepGame(game :Game, indexPlayer:Int)
    func didEndGame(player:Int)
}
