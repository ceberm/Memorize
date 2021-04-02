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
        Grid(items: viewModel.cards) { card in
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
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else{
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
                
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: -Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
