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
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count > 4 ? Font.subheadline : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
                
            }
            

        }.aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }
}
