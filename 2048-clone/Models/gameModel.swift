//
//  gameModel.swift
//  2048-clone
//
//  Created by apple on 10/09/18.
//  Copyright © 2018 shiv. All rights reserved.
//

import Foundation
import UIKit

protocol GameModelProtocol: class {
    func scoreChanged(to score: Int)
    func moveOneTile(from: (Int, Int), to: (Int, Int), value: Int)
    func moveTwoTiles(from: ((Int,Int), (Int,Int)), to: (Int,Int), value: Int)
    func insertTile(at location: (Int, Int), withValue value: Int)
}

class GameModel: NSObject {
    
    let dimension: Int
    let threshold: Int
    
    var score: Int = 0 {
        didSet {
            delegate.scoreChanged(to: score)
        }
    }
    
    var gameboard: SquareGameboard<TileObject>
    unowned let delegate: GameModelProtocol
    
    var queue: [MoveCommand]
    var timer: Timer
    
    let maxCommands = 100
    let queueDelay: 0.3
    
    init(dimension d: Int, threshold t: Int, delegate: GameModelProtocol) {
        dimension = d
        threshold = t
        self.delegate = delegate
        queue = [MoveCommand]()
        timer = Timer()
        gameboard = SquareGameboard(dimension: d, initialValue: .empty)
        super.init()
    }
    
    func reset() {
        score = 0
        gameboard.setAll(to: .empty)
        queue.removeAll(keepingCapacity: true)
        timer.invalidate()
    }
    
    func queueMove(direction: MoveDirection, onCompletion: @escaping (Bool) -> ()) {
        guard queue.count <= maxCommands else {
            // Queue is wedged. This should actually never happen in practice.
            return
        }
        queue.append(MoveCommand(direction: direction, completion: onCompletion))
        if !timer.isValid {
            // Timer isn't running, so fire the event immediately
            timerFired(timer)
        }
    }
    
    @objc func timerFired(_: Timer) {
        
    }
    
}
