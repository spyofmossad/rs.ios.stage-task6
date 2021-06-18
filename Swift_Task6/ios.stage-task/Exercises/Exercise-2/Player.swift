//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        return hand?.contains(where: { $0.value == card.value }) ?? false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
       return table.keys.map { checkIfCanTossWhenAttacking(card: $0) }.contains(true) ||
            table.values.map { checkIfCanTossWhenAttacking(card: $0) }.contains(true)
    }
}
