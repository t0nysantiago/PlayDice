//
//  DiceView.swift
//  PlayDice
//
//  Created by Tony Santiago on 04/12/23.
//

import SwiftUI

struct DiceView: View {
    @Binding var dice: Dice

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(dice.color)
                .frame(width: 150, height: 150)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10)

            ForEach(0..<numberOfDots(value: dice.value), id: \.self) { index in
                Circle()
                    .foregroundColor(dice.dotColor)
                    .frame(width: 20)
                    .offset(dotPosition(value: dice.value, index: index))
            }
        }
    }

    func numberOfDots(value: Int) -> Int {
        switch value {
        case 1: return 1
        case 2: return 2
        case 3: return 3
        case 4: return 4
        case 5: return 5
        case 6: return 6
        default: return 1
        }
    }

    func dotPosition(value: Int, index: Int) -> CGSize {
        switch value {
        case 1:
            return CGSize(width: 0, height: 0)
        case 2:
            switch index {
            case 0: return CGSize(width: 45, height: -45)
            case 1: return CGSize(width: -45, height: 45)
            default: return CGSize()
            }
        case 3:
            switch index {
            case 0: return CGSize(width: 45, height: -45)
            case 1: return CGSize(width: 0, height: 0)
            case 2: return CGSize(width: -45, height: 45)
            default: return CGSize()
            }
        case 4:
            switch index {
            case 0: return CGSize(width: 45, height: 45)
            case 1: return CGSize(width: 45, height: -45)
            case 2: return CGSize(width: -45, height: 45)
            case 3: return CGSize(width: -45, height: -45)
            default: return CGSize()
            }
        case 5:
            switch index {
            case 0: return CGSize(width: 0, height: 0)
            case 1: return CGSize(width: 45, height: 45)
            case 2: return CGSize(width: 45, height: -45)
            case 3: return CGSize(width: -45, height: 45)
            case 4: return CGSize(width: -45, height: -45)
            default: return CGSize()
            }
        case 6:
            switch index {
            case 0: return CGSize(width: -45, height: -45)
            case 1: return CGSize(width: -45, height: 0)
            case 2: return CGSize(width: -45, height: 45)
            case 3: return CGSize(width: 45, height: 0)
            case 4: return CGSize(width: 45, height: -45)
            case 5: return CGSize(width: 45, height: 45)
            default: return CGSize()
            }
        default:
            return CGSize()
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(dice: .constant(Dice.init(value: 1, color: Color.red, dotColor: Color.white)))
    }
}
