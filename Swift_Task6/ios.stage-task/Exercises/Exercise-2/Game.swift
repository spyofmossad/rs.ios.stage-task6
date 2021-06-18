//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        
        return players.sorted { player1, player2 in
            let card1 = player1.hand?
                .sorted { $0.suit.rawValue < $1.suit.rawValue }
                .first(where: { $0.isTrump == true })
            
            let card2 = player2.hand?
                .sorted { $0.suit.rawValue < $1.suit.rawValue }
                .first(where: { $0.isTrump == true })
            
            return card1?.suit.rawValue ?? Int.max < card2?.suit.rawValue ?? Int.max
        }.first
    }
}
