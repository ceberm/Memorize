//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import Foundation

//###
//### Model struct for EmojiMemory Game
//###


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set)var themes: [Theme]
    var score: Int
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func pick(card: Card) {
        print("Card clicked! \(card)")
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    //Assign Score
                    score = score + 2
                }else{
                    if(self.cards[potentialMatchIndex].wasFlipped){
                        score = score - 1
                    }
                    if(self.cards[chosenIndex].wasFlipped){
                        score = score - 1
                    }
                }
                self.cards[chosenIndex].isFaceUp = true
                self.cards[chosenIndex].wasFlipped = true
                self.cards[potentialMatchIndex].wasFlipped = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var wasFlipped: Bool = false
        var content: CardContent
        var id: Int
    }
    
    struct Theme {
        var name: String
        var emojis: [String]
        var numberOfPairsOfCards: Int
    }
    
    enum ThemeType: Int {
        case Halloween, Animals, Sports, Fruits, Music, Vehicles, Foods
    }
    
    mutating func createRandomTheme() -> Theme {
        if(themes.isEmpty) {
            setUpThemes()
        }
        let randomType = ThemeType(rawValue: Int.random(in: 1...themes.count - 1))!
        switch randomType {
        case .Animals:
            return themes[0]
        case .Sports:
            return themes[1]
        case .Fruits:
            return themes[2]
        case .Halloween:
            return themes[3]
        case .Music:
            return themes[4]
        case .Vehicles:
            return themes[5]
        case .Foods:
            return themes[6]
        }
    }
    
    init(theme: Theme, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        themes = Array<Theme>()
        score = 0
        for pairIndex in 0..<theme.numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        setUpThemes()
    }
    
    mutating func setUpThemes() {
        let hallowenEmojis = ["👻", "🎃", "🕷", "🧛‍♂️", "💀"]
        let animalEmojis = ["🐶", "🐹", "🦁", "🦊", "🐻"]
        let sportsEmojis = ["🏐", "🏀", "⚽️", "🏈", "🛼"]
        let fruitsEmojis = ["🍎", "🍋", "🍉", "🥑", "🍑"]
        let rapidFoodsEmojis = ["🍔", "🍕", "🍟", "🌯", "🌭"]
        let musicEmojis = ["🎷", "🪘", "🎸", "🎻", "🎺"]
        let vehiclesEmojis = ["🚗", "🚕", "🛻", "🚌", "🚛", "🚜", "🏍"]
        
        themes.append(Theme(name: "Animals_Theme", emojis: animalEmojis, numberOfPairsOfCards: Int.random(in: 2...animalEmojis.count)))
        
        themes.append(Theme(name: "Sports_Theme", emojis: sportsEmojis, numberOfPairsOfCards: Int.random(in: 2...sportsEmojis.count)))
        
        themes.append(Theme(name: "Fruits_Theme", emojis: fruitsEmojis, numberOfPairsOfCards: Int.random(in: 2...fruitsEmojis.count)))
        
        themes.append(Theme(name: "Halloween_Theme", emojis: hallowenEmojis, numberOfPairsOfCards: Int.random(in: 2...hallowenEmojis.count)))
        
        themes.append(Theme(name: "Music_Theme", emojis: musicEmojis, numberOfPairsOfCards: Int.random(in: 2...musicEmojis.count)))
        
        themes.append(Theme(name: "Vehicles_Theme", emojis: vehiclesEmojis, numberOfPairsOfCards: Int.random(in: 2...vehiclesEmojis.count)))
        
        themes.append(Theme(name: "Foods_Theme", emojis: rapidFoodsEmojis, numberOfPairsOfCards: Int.random(in: 2...rapidFoodsEmojis.count)))
    
    }

}
