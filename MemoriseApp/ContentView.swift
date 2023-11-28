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
    @State var isFaceUp = false
    var body: some View{
        
        let stack =  RoundedRectangle(cornerRadius: 12)
        
            ZStack {
                if isFaceUp{
                    stack.fill(.white)
                    stack.stroke(lineWidth: 2.0)
                    Text("🤯").font(.largeTitle)
                }else{
                    stack.fill()
                }
            }.onTapGesture {
                isFaceUp.toggle()
            }
            .padding()
        
    }
}

#Preview {
    ContentView()
}
