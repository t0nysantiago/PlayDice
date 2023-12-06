//
//  StyledButtonView.swift
//  PlayDice
//
//  Created by Tony Santiago on 04/12/23.
//

import SwiftUI

struct StyledButtonView: View {
    @Binding var viewModel: DiceViewModel
    var body: some View {
        ZStack {
            Button(action: viewModel.rollDices) {
                Text("Play")
                    .font(.system(size: 20, design: Font.Design.rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#EAE2B7"))
                    .padding()
                    .frame(maxWidth: 180)
            }
            .background(Color(hex: "#F77F00"))
            .cornerRadius(10)
        }
    }
}
