//
//  Quantumizing.swift
//  AgenThinking
//  Meaning: Existing in many possible states at once.
//  Use case: When an agent explores several candidate solutions in parallel before choosing one.
//  Motion: Each letter exists as flickering cyan and magenta probability ghosts until, periodically, the word is observed and collapses sharp.
//

import SwiftUI

struct Quantumizing: View {
    private let period = 2.6

    var body: some View {
        Clock { t in
            let collapse = Motion.window(Motion.phase(t, period), 0.7, 0.75, 0.92, 1)
            let tick = Int(t * 12)
            HStack(spacing: 8) {
                Image(systemName: "atom")
                    .foregroundStyle(.cyan)
                    .rotationEffect(.degrees(t * (collapse > 0.5 ? 20 : 180)))
                Glyphs("Quantumizing", time: t) { g in
                    let spread = 1 - collapse
                    ZStack {
                        g.text
                            .foregroundStyle(.cyan)
                            .offset(x: (Motion.random(g.index, tick) - 0.5) * 8 * spread, y: (Motion.random(g.index, tick + 1) - 0.5) * 10 * spread)
                            .opacity(0.6 * spread)
                        g.text
                            .foregroundStyle(.pink)
                            .offset(x: (Motion.random(g.index, tick + 2) - 0.5) * 8 * spread, y: (Motion.random(g.index, tick + 3) - 0.5) * 10 * spread)
                            .opacity(0.6 * spread)
                        g.text
                            .foregroundStyle(.white)
                            .opacity(collapse + spread * Motion.random(g.index, tick + 4) * 0.5)
                    }
                    .blendMode(.plusLighter)
                }
            }
        }
    }
}

#Preview {
    Quantumizing()
}
