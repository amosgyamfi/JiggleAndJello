//
//  Shenaniganing.swift
//  AgenThinking
//  Meaning: Up to playful mischief.
//  Use case: A lighthearted state for fun or experimental agent modes.
//  Motion: Pranksters strike at random: one letter flips upside down, another pops up in a new color, while theater masks wobble.
//

import SwiftUI

struct Shenaniganing: View {
    private let prank = 0.9

    var body: some View {
        Clock { t in
            let round = Int(t / prank)
            let word = "Shenaniganing"
            let flipper = Int(Motion.random(round, 1) * Double(word.count))
            let popper = Int(Motion.random(round, 2) * Double(word.count))
            let trick = Motion.window(Motion.phase(t, prank), 0, 0.2, 0.6, 0.85)
            HStack(spacing: 8) {
                Image(systemName: "theatermasks.fill")
                    .foregroundStyle(.purple)
                    .rotationEffect(.degrees(sin(t * 5) * 15))
                Glyphs(word, time: t) { g in
                    let flipped = g.index == flipper ? trick : 0
                    let popped = g.index == popper && popper != flipper ? trick : 0
                    g.text
                        .foregroundStyle(Color.white.mix(.green, flipped).mix(.pink, popped))
                        .rotationEffect(.degrees(180 * flipped))
                        .offset(y: -10 * popped)
                        .scaleEffect(1 + 0.3 * popped)
                }
            }
        }
    }
}

#Preview {
    Shenaniganing()
}
