//
//  ContentView.swift
//  Memorize
//
//  Created by Grzegorz Berk on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["🎅🏻", "🎄", "⛄️", "🎁", "❄️", "⛷️", "🌟", "🧸",]
        HStack{
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
            }
        }.padding()
        .foregroundColor(.red)
    }
}


struct CardView: View {
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
















#Preview {
    ContentView()
}
