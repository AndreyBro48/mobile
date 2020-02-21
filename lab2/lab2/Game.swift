//
//  Game.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

    
import Foundation

class Game{
    private(set) var positionsPlayers:Array<Int>
    var ds:GameDataSource? = nil
    var delegateUI:GameDelegate? = nil
    var lastMovePlayer:Int = 0
    var theEnd = false
    var countPlayers:Int {
        get{
            return positionsPlayers.count
        }
    }
    init(countPlayers:Int) {
        positionsPlayers = Array<Int>()
        for _ in 1...countPlayers{
            positionsPlayers.append(0)
        }
    }
    
    func startGame() {
        for i in 0..<countPlayers{
            positionsPlayers[i] = 0
        }
        theEnd = false
        lastMovePlayer=countPlayers-1
        self.delegateUI?.didStartGame(game:self)
    }
    
    func getNextPlayer() -> Int {
        if (lastMovePlayer + 1 == positionsPlayers.count) {
            return 0
        }
        return lastMovePlayer + 1
    }
    
    func checkWinner() -> Bool {
        for i in 0..<positionsPlayers.count {
            if (ds != nil){
                if positionsPlayers[i] == ds!.getField().cells.count {
                    return true
                }
            }
        }
        return false
    }
    
    func nextMovePlayerRandom(){
        let curPlayer = getNextPlayer()
        nextMoveRandom(player:curPlayer)
        lastMovePlayer = curPlayer
    }
    
    func nextMovePlayerByCube(resultCube: Int){

        let curPlayer = getNextPlayer()
        move(player: curPlayer, resultCube: resultCube)
        lastMovePlayer = curPlayer
    }
    
    func nextMoveRandom(player:Int){
        let resultCube = Int.random(in: 1...6)
        move(player: player, resultCube: resultCube)
    }
    
    func move(player:Int, resultCube:Int){
        //check winner player
        if checkWinner() { return }
        
        var curPlace = positionsPlayers[player]
        if (ds != nil){
            switch ds!.getField().cells[curPlace] {
            case TypeCell.Next: curPlace += resultCube
            case TypeCell.Back: curPlace -= resultCube
            }
        }
        if (curPlace < 0){
            curPlace = 0
        }
        if let ds = ds {
            if (curPlace >= ds.getField().cells.count) {
                curPlace = ds.getField().cells.count
                theEnd = true
            }
            positionsPlayers[player] = curPlace
            delegateUI?.didStepGame(game:self, indexPlayer: player)
            if theEnd {delegateUI?.didEndGame(player: player)}
        }
    }
    
    func getField() -> Field? {
        return ds?.getField()
    }
}

