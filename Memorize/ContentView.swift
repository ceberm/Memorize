//
//  ContentView.swift
//  Memorize
//
//  Created by Cesar on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HStack(content: {
//            ForEach(0..<4, content: {_ in
//                ZStack(content: {
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
//                    Text("👻")
//                })
//            })
//        })
//        .padding()
//        .foregroundColor(Color.orange)
//        .font(Font.largeTitle)
        
        HStack {
            ForEach(0..<4) {_ in
                CardView(isFaceUp: false)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        HStack {
            ForEach(0..<4) {_ in
                CardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        
            
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View{
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            

        }
    }
}
