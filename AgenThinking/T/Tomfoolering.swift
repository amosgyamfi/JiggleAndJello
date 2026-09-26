//
//  Tomfoolering.swift
//  AgenThinking
//  Meaning: Silly, foolish, playful behavior.
//  Use case: A goofy state for playful or easter-egg modes.
//  Motion: One jester letter at a time leaps up and cartwheels a full turn, changing its jester color and landing with a squash.
//

import SwiftUI

struct Tomfoolering: View {
    private let jester: [Color] = [.red, .yellow, .green, .purple]

    var body: some View {
        Clock { t in
            Glyphs("Tomfoolering", time: t) { g in
                let jump = Motion.ramp(g.phase(3.6, lag: -0.08), 0, 0.2)
                let land = Motion.ramp(g.phase(3.6, lag: -0.08), 0.2, 0.3)
                let squash = jump >= 1 ? sin(land * .pi) : 0
                let flips = g.cycle(3.6, lag: -0.08)
                g.text
                    .foregroundStyle(jester[(g.index + flips) % jester.count].mix(.white, 0.25))
                    .rotationEffect(.degrees(Motion.smooth(jump) * (g.isEven ? 360 : -360)))
                    .offset(y: -18 * Motion.hop(jump))
                    .scaleEffect(x: 1 + 0.25 * squash, y: 1 - 0.25 * squash, anchor: .bottom)
            }
        }
    }
}

#Preview {
    Tomfoolering()
}
