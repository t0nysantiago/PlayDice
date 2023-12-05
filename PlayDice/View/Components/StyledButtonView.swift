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
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 180)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
        }
    }
}
