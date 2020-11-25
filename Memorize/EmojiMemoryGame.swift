//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = createMemoryGame()
    
    //        MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😁" }
    //        MemoryGame<String>(numberOfPairsOfCards: 2) { (pairIndex: Int) -> String in
    //            return "😁"
    //        }
    //Se pueden inferir los tipos y se saca el ultimo parametro entre llaves flotando y se le quita el keyword
    //    MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😁" }
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //MARK: - Inten(s)
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.pick(card: card)
    }
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["👻", "🎃", "🕷", "🧛‍♂️", "💀"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 1...emojis.count), cardContentFactory: {pairIndex in
            return emojis[pairIndex]
        })
    }
}
