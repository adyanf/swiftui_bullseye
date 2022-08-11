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
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, 100.0)
                HitButtonView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
            }
            SliderView(sliderValue: $sliderValue)
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
            BigNumberText(number: game.target)
        }
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct HitButtonView: View {
    
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button("HIT ME", action: {
            isAlertVisible = true
        })
            .bold()
            .font(.title3)
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .cornerRadius(21.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color.white, lineWidth: 2.0)
            )
            .alert("Hello, there!", isPresented: $isAlertVisible) {
                Button("Awesome!") {
                    let score = game.points(sliderValue: Int(sliderValue.rounded()))
                    isAlertVisible = false
                    game.startNewRound(points: score)
                }
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                let score = game.points(sliderValue: roundedValue)
                Text("The slider's value is \(roundedValue).\n" + "You scored \(score) points this round.")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
