//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
//    @ObservedObject se llama cada vez que el modelo cambia o llama
//    a objectWillChange.send() y vuelve a dibujar la UI
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.chooseCard(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(viewModel.getColorTheme())
        .padding()
        Text("Score \(viewModel.getScore())")
            .padding()
        Button(action: {
            viewModel.resetMemoryGame()
        }, label: {
            Text("Reset Game")
        })
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
         GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    //MARK: -Drawing Constants
    private let fontScaleFactor: CGFloat = 0.7
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chooseCard(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
