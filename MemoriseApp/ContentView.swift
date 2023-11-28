//
//  ContentView.swift
//  MemoriseApp
//
//  Created by SREEKANTH PS on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    var isFaceUp = false
    var body: some View{
        
            ZStack {
                if isFaceUp{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2.0)
                    Text("🤯").font(.largeTitle)
                }else{
                    RoundedRectangle(cornerRadius: 12)
                }
            }
            .padding()
        
    }
}

#Preview {
    ContentView()
}
