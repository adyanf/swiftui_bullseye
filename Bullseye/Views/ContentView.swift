//
//  ContentView.swift
//  Bullseye
//
//  Created by Adya Naufal Fikri on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()

    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("\(game.target)")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }.padding(CGFloat(16))
            Button("Hit me", action: {
                isAlertVisible = true
            })
            .alert("Hello, there!", isPresented: $isAlertVisible) {
                Button("Awesome!") {
                    isAlertVisible = false
                }
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                let score = game.points(sliderValue: roundedValue)
                Text("The slider's value is \(roundedValue).\n" + "You scored \(score) points this round.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
