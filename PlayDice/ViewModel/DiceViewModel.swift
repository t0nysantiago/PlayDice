//
//  DiceViewModel.swift
//  PlayDice
//
//  Created by Tony Santiago on 04/12/23.
//

import Foundation

class DiceViewModel: ObservableObject {
    @Published var dice1: Dice
    @Published var dice2: Dice
    @Published var sumOfDices: Int = 0
    @Published var isAnimating: Bool = false

    init() {
        dice1 = Dice(value: 3, color: .red, dotColor: .white)
        dice2 = Dice(value: 5, color: .white, dotColor: .black)
        sumOfDices = dice1.value + dice2.value
    }

    func rollDices() {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dice1.value = Int.random(in: 1...6)
            self.dice2.value = Int.random(in: 1...6)
            self.sumOfDices = self.dice1.value + self.dice2.value
            self.isAnimating = false
        }
    }
}
