//
//  ContentView.swift
//  Memorize
//
//  Created by Grzegorz Berk on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    let iconSet = EmojiSet()
    @State var cardCount = 4
    @State var emojis = ["🎅🏻","🎅🏻", "🎄", "🎄", "⛄️", "⛄️", "🎁", "🎁", "❄️", "❄️", "⛷️", "⛷️", "🌟", "🌟", "🧸", "🧸", "👼🏻", "👼🏻", "🤶🏻", "🤶🏻", "💝", "💝", "🛷", "🛷"]
    
    
    var body: some View {
        Text("Memorize!").font(.largeTitle)
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            themeButtons
        }.padding()
    }
    
    var themeButtons: some View {
        HStack{
            themeButton(is: "Christmas", symbol: "gift.fill", iconSet.christmasEmoji)
            themeButton(is: "Vehicles", symbol: "car.rear.fill", iconSet.vehiclesEmoji)
            themeButton(is: "Halloween", symbol: "moon.fill", iconSet.halloweenEmoji)
        }
    }
    
    func themeButton(is name: String, symbol: String, _ iconSet: [String]) -> some View{
        Button(action: {
            emojis = iconSet
            emojis.shuffle()
        }, label: {
            VStack{
                Image(systemName: symbol).font(.title)
                Text(name).font(.callout)
            }
        }).disabled(iconSet.sorted() == emojis.sorted())
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }.foregroundColor(.red)
        }
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
