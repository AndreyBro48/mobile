//
//  ConsoleGameDelegate.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

class ConsoleGameDelegate : GameDelegate{
    func didEndGame(player indexPlayer: Int) {
        print("Выиграл игрок под номером " + String(indexPlayer + 1))
    }
    
    func didStartGame(game: Game) {
        refresh(game:game)
        print()
        print()
    }
    
    func didStepGame(game: Game, indexPlayer: Int) {
        refresh(game: game)
        print("Игрок \(indexPlayer+1) перешел на позицию \(game.positionsPlayers[indexPlayer])")
        print()
        print()
    }
    
    func writePlayers(game:Game, pos:Int) -> String{
        var line = ""
        for j in 0..<game.positionsPlayers.count {
            if (game.positionsPlayers[j]==pos){
                line += "\(j+1)"
            } else {
                line += " "
            }
        }
        return line
    }
    
    func refresh(game:Game) {
        if let field = game.getField() {
            for i in 0..<field.cells.count {
                var line = "\(i)." + field.cells[i].rawValue + "\t"
                line += writePlayers(game: game, pos: i)
                print(line)
            }
            print("\(field.cells.count).Финиш \t\(writePlayers(game: game, pos: field.cells.count))")
        }
    }
}

