//
//  Recombobulating.swift
//  AgenThinking
//  Meaning: Pulling yourself back together after confusion.
//  Use case: When an agent recovers from an error and resumes with a clean state.
//  Motion: Tumbled, scattered letters spring back into order with elastic overshoot and a reassuring green glow.
//

import SwiftUI

struct Recombobulating: View {
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let round = Int(t / period) + (beat > 0.9 ? 1 : 0)
            let calm = Motion.window(beat, 0.55, 0.65, 0.85, 0.95)
            Glyphs("Recombobulating", time: t) { g in
                let start = 0.1 + g.progress * 0.3
                let chaos = beat < start ? 1 : Motion.spring(Motion.ramp(beat, start, start + 0.35), bounces: 2.5)
                let rejumble = Motion.ramp(beat, 0.9, 1)
                let mess = beat > 0.9 ? rejumble : chaos
                g.text
                    .foregroundStyle(Color.orange.mix(.green, 1 - min(abs(mess), 1)))
                    .rotationEffect(.degrees(mess * (g.random(round) - 0.5) * 200))
                    .offset(x: mess * (g.random(round + 1) - 0.5) * 16, y: mess * (g.random(round + 2) - 0.5) * 34)
                    .scaleEffect(1 + mess * (g.random(round + 3) - 0.5) * 0.6)
            }
            .glow(.green.opacity(calm * 0.8), radius: 10 * calm)
        }
    }
}

#Preview {
    Recombobulating()
}
