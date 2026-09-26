//
//  Prestidigitating.swift
//  AgenThinking
//  Meaning: Sleight of hand; performing magic tricks.
//  Use case: When an agent pulls off a surprising, clever transformation.
//  Motion: Letters flip over like playing cards to reveal suits (♠ ♥ ♦ ♣) with a sparkle, then flip back, with random ones flipped each round.
//

import SwiftUI

struct Prestidigitating: View {
    private let suits = ["♠", "♥", "♦", "♣"]
    private let period = 2.8

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let round = Int(t / period)
            Glyphs("Prestidigitating", time: t) { g in
                let tricked = g.random(round) > 0.45
                let flip = tricked ? Motion.window(beat, 0.1 + g.progress * 0.2, 0.25 + g.progress * 0.2, 0.65, 0.8) : 0
                let angle = flip * 180
                let showSuit = angle > 90
                let suit = suits[(g.index + round) % suits.count]
                Text(showSuit ? suit : g.character)
                    .foregroundStyle(showSuit ? (suit == "♥" || suit == "♦" ? Color.red : .white) : Color(red: 0.85, green: 0.75, blue: 1))
                    .rotation3DEffect(.degrees(showSuit ? angle - 180 : angle), axis: (x: 0, y: 1, z: 0), perspective: 0.5)
                    .overlay {
                        Image(systemName: "sparkle")
                            .font(.system(size: 10))
                            .foregroundStyle(.yellow)
                            .scaleEffect(Motion.bell((flip - 0.5) / 0.15))
                    }
            }
        }
    }
}

#Preview {
    Prestidigitating()
}
