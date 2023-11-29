//
//  ContentView.swift
//  MemoriseApp
//
//  Created by SREEKANTH PS on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    var cars = ["🚗","🚕","🚙","🚓","🚔","🚘","🚜","🛻","🚖"]
    var fruits = ["🍏","🍐","🍊","🍋","🍌","🍇","🍓","🥭","🍍"]
    var music = ["🥁","🎹","🪗","🎸","🎺","🪕","🪈","🪘","🪇"]
    
    @State var cardCount:Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cardsView
            }
            Spacer()
            cardCountAdjusters
        }.padding()
    }
    
    var cardsView: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
            ForEach(0..<cardCount, id: \.self){index in
                CardView(isFaceUp: true, content: cars[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        })
        .foregroundColor(.orange)
        
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }.imageScale(.large)
            .font(.largeTitle)
    }
    
    func cardCountAdjusters(by offset:Int, symbol:String)-> some View{
        Button {
                cardCount += offset
        } label: {
            Image(systemName: symbol)
        }.disabled(cardCount + offset < 1 || cardCount + offset > cars.count  )
    }
    
    var cardAdder: some View{
        cardCountAdjusters(by: -1, symbol:  "rectangle.stack.fill.badge.minus")
      
    }
    
    var cardRemover: some View{
        
        cardCountAdjusters(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}


struct CardView: View {
    @State var isFaceUp = false
    let content:String
    
    var body: some View{
        
        let stack =  RoundedRectangle(cornerRadius: 12)
            
            ZStack {
                Group{
                    stack.fill(.white)
                    stack.stroke(lineWidth: 2.0)
                    Text(content).font(.largeTitle)
                }.opacity(isFaceUp ? 1:0)
                
                stack.fill().opacity(isFaceUp ? 0:1)
            }.onTapGesture {
                isFaceUp.toggle()
            }
            .padding()
        
    }
}

#Preview {
    ContentView()
}
