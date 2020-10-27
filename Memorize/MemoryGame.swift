//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import Foundation


struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func pick(card: Card) {
        print("Card clicked! \(card)")
    }
    
    struct Card: Identifiable {
        var cardIsFaceUp: Bool = true
        var cardIsMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
}
