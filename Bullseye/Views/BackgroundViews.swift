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
                RingsView()
            )
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(colors: [Color("RingColor").opacity(opacity), Color("RingColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct TopView: View {

    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }, label: {
                RoundedImageViewFilled(systemName: "list.dash")
            })
            .sheet(isPresented: $leaderboardIsShowing, onDismiss: {
                leaderboardIsShowing = false
            }, content: {
                LeaderboardView(game: $game, leaderboardIsShowing: $leaderboardIsShowing)
            })
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
