//
//  BackgroundViews.swift
//  Bullseye
//
//  Created by Adya Naufal Fikri on 10/08/22.
//

import SwiftUI

struct BackgroundView: View {

    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {

    @Binding var game: Game
    
    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {

    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: "\(game.score)")
            Spacer()
            NumberView(title: "Round", text: "\(game.round)")
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
