//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards = [Card]()
    
    init(){ self.cards = generateDeck() }
    
    func generateDeck() -> [Card] {
        var counter = 2
        var returnCard = [Card]()
        
        let clubSuit = Suit(rawValue: "♠️")!
        let diamondSuit = Suit(rawValue: "♦️")!
        let spadeSuit = Suit(rawValue: "♣️")!
        let heartSuit = Suit(rawValue: "♥️")!
        
           for _ in 2...14 { //Rank
            let deckRank = Rank(rawValue: counter)!
            counter += 1
            returnCard.append(Card(rank: deckRank , suit: clubSuit))
            returnCard.append(Card(rank: deckRank , suit: diamondSuit))
            returnCard.append(Card(rank: deckRank , suit: spadeSuit))
            returnCard.append(Card(rank: deckRank , suit: heartSuit))
            print(returnCard[counter])
        }
        
    return returnCard.shuffled()
    }
    
    func split() -> ([Card],[Card]) {
        return cards.split()
    }
}
