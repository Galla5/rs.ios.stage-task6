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
        guard let cards = hand else { return false}
        let card = cards.first(where: { $0.value.rawValue == card.value.rawValue })
        return card != nil
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        false
    }
}
