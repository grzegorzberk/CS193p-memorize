//
//  ContentView.swift
//  Memorize
//
//  Created by Grzegorz Berk on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount = 4
    let emojis = ["🎅🏻", "🎄", "⛄️", "🎁", "❄️", "⛷️", "🌟", "🧸",]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }.foregroundColor(.red)
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
                .font(.largeTitle)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}


struct CardView: View {
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

 














#Preview {
    ContentView()
}
