//
//  Finagling.swift
//  AgenThinking
//  Meaning: Cleverly maneuvering to get something to work.
//  Use case: When an agent works around a limitation with a clever hack.
//  Motion: Neighboring letters sneakily swap places, one looping over the other, then slip back before anyone notices.
//

import SwiftUI

struct Finagling: View {
    private let word = "Finagling"
    private let step = 0.9
    private let letterWidth = 14.0

    var body: some View {
        Clock { t in
            let pair = (Int(t / step) * 3) % (word.count - 1)
            let swap = Motion.window(Motion.phase(t, step), 0, 0.3, 0.55, 0.9)
            let arc = sin(swap * .pi)
            Glyphs(word, time: t) { g in
                let first = g.index == pair
                let second = g.index == pair + 1
                g.text
                    .foregroundStyle(first || second ? Color.green.mix(.white, 0.3) : .white)
                    .offset(
                        x: first ? letterWidth * swap : second ? -letterWidth * swap : 0,
                        y: first ? -10 * arc : second ? 8 * arc : 0
                    )
                    .scaleEffect(first ? 1 + 0.15 * arc : second ? 1 - 0.15 * arc : 1)
            }
        }
    }
}

#Preview {
    Finagling()
}
