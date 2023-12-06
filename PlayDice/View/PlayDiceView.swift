//
//  PlayDiceView.swift
//  PlayDice
//
//  Created by Tony Santiago on 04/12/23.
//

import SwiftUI

struct PlayDiceView: View {
    @StateObject var viewModel = DiceViewModel()

    var body: some View {
        ZStack {
            Color(hex: "#003049").ignoresSafeArea()
            VStack {
                Text("Play Dice")
                    .font(.system(size: 40, design: Font.Design.rounded))
                    .foregroundStyle(Color(hex: "#EAE2B7"))
                    .padding(.bottom, 10)
                
                Text("The sum of dices is equals to:")
                    .font(.system(size: 15, design: Font.Design.rounded))
                    .foregroundStyle(Color(hex: "#EAE2B7"))
                    .padding(.bottom, 5)
                
                Text(String(viewModel.sumOfDices))
                    .foregroundStyle(Color(hex: "#EAE2B7"))
                    .font(.system(size: 60, design: Font.Design.rounded))

                ZStack {
                    DiceView(dice: $viewModel.dice1)
                        .offset(viewModel.isAnimating ? CGSize(width: -20.0, height: -20.0) : CGSize(width: -40.0, height: -70.0))
                        .rotationEffect(.degrees(viewModel.isAnimating ? -180 : 0))
                        .animation(.easeInOut(duration: 0.5), value: viewModel.isAnimating)
                    
                    DiceView(dice: $viewModel.dice2)
                        .offset(viewModel.isAnimating ? CGSize(width: 20.0, height: 40.0) : CGSize(width: 40.0, height: 90.0))
                        .rotationEffect(.degrees(viewModel.isAnimating ? -180 : 0))
                        .animation(.easeInOut(duration: 0.5), value: viewModel.isAnimating)
                }
                .padding(.top, 100)
                
                Spacer(minLength: 200)
                
                StyledButtonView(viewModel: .constant(viewModel))
                
                Spacer()
            }
            .padding()
        }.onAppear {
            viewModel.sumOfDices = viewModel.dice1.value + viewModel.dice2.value
        }
    }
}


#Preview {
    PlayDiceView()
}
