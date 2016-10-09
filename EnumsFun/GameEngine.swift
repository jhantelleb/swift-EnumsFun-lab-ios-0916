//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck: Deck
    
    init(player1: String, player2: String) {
        self.deck = Deck()
        let playerCards = deck.cards.split()
        self.player1 = Player(name: player1, hand: Hand(cards: playerCards.0))
        self.player2 = Player(name: player2, hand: Hand(cards: playerCards.1))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        var winner =  player1
        //let emptyCard = Card(rank: Rank(rawValue: 0)!, suit: Suit(rawValue: "")!)
        if player1.hasCards() && player2.hasCards() {
            if (player1.flip()?.rank.rawValue)! >= (player2.flip()?.rank.rawValue)! {
                winner = player1
            }else {
                winner = player2
            }
                return (winner, player1.hand.cards[0], player2.hand.cards[0])
            }
        else {
            if !player1.hasCards() {
                return (player2, nil , nil)
            } else {
            return (player1, nil, nil )
            }
        }
    }
    
    func award(cards: [Card], to: Player ) {
        for card in cards { to.give( card: card ) }
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
}
        

