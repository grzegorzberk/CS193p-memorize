//
//  ContentView.swift
//  Memorize
//
//  Created by Grzegorz Berk on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }.padding()
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    var isFaceUp = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🎉").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }


}

















#Preview {
    ContentView()
}
