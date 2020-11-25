//
//  ContentView.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    viewModel.chooseCard(card: card)
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
            if card.cardIsFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
                Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            

        }
    }
}
