//
//  TextViews.swift
//  Bullseye
//
//  Created by Adya Naufal Fikri on 09/08/22.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("LabelTextColor"))
    }
}

struct BigNumberText: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("LabelTextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("LabelTextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Color("LabelTextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
        BigNumberText(number: 50)
    }
}
