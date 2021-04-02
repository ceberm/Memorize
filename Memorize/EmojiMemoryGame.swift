//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.


import SwiftUI

//###
//### View Model for EmojiMemory Game
//###


class EmojiMemoryGame: ObservableObject {
    //@Published es un property wrapper
    //cada vez que el modelo cambia llama a objectWillChange.send() esto con el fin de no llamar a esta funcion
    //todas las veces desde los intents 
    @Published private var model: MemoryGame<String> = createMemoryGame()
    private var currentColor: Color?
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["👻", "🎃", "🕷", "🧛‍♂️", "💀"]
        let theme = MemoryGame<String>.Theme(name: "Halloween_Theme", emojis: emojis, numberOfPairsOfCards: Int.random(in: 2...emojis.count))
        return MemoryGame<String>(theme: theme, cardContentFactory: {pairIndex in
            return theme.emojis[pairIndex]
        })
    }
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func resetMemoryGame(){
        let theme = model.createRandomTheme()
        currentColor = Color(theme.name)
        model = MemoryGame<String>(theme: theme, cardContentFactory: {pairIndex in
            return theme.emojis[pairIndex]
        })
    }
    
    func getScore() -> Int{
        return model.score
    }
    
    func getColorTheme() -> Color {
        if(currentColor == nil){
            currentColor = Color("Halloween_Theme")
        }
        return currentColor!
    }
    
    //MARK: - Inten(s)
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.pick(card: card)
    }
}
