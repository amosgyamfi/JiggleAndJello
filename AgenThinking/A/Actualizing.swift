//
//  Actualizing.swift
//  AgenThinking
//  Meaning: Turning an idea or plan into something real.
//  Use case: When an agent moves from planning to producing a concrete output.
//  Motion: Blurry, oversized ghost letters condense from the center outward into crisp, solid type.
//

import SwiftUI

struct Actualizing: View {
    private let word = "Actualizing"
    private let period = 3.2

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            Glyphs(word, time: t) { g in
                let start = abs(g.centered) * 0.25
                let real = Motion.window(beat, start, start + 0.3, 0.85, 1)
                g.text
                    .foregroundStyle(Color.purple.mix(.white, real))
                    .blur(radius: (1 - real) * 6)
                    .scaleEffect(1.6 - 0.6 * real)
                    .opacity(0.15 + 0.85 * real)
                    .offset(y: (1 - real) * -8)
            }
            .glow(.purple.opacity(0.6), radius: 6)
        }
    }
}

#Preview {
    Actualizing()
}
