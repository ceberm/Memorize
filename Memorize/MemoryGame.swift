//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import Foundation


struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    mutating func pick(card: Card) {
        print("Card clicked! \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if(self.cards[index].id == card.id){
                return index
            }
        }
        return 0 //TODO: bogus!
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
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
        cards.shuffle()
    }
}
