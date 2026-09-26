//
//  Channelling.swift
//  AgenThinking
//  Meaning: Tuning in to a signal and letting it come through clearly.
//  Use case: When an agent locks onto the right source or context after noisy searching.
//  Motion: Letters start as flickering static, then tune into a clean, smooth sine wave as the antenna locks on.
//

import SwiftUI

struct Channelling: View {
    private let period = 4.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let tuned = Motion.window(beat, 0.25, 0.5, 0.9, 1)
            HStack(spacing: 8) {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(Color.teal.mix(.white, tuned))
                    .opacity(0.5 + 0.5 * tuned)

                Glyphs("Channelling", time: t) { g in
                    let staticNoise = Motion.random(g.index, Int(t * 24)) * 2 - 1
                    g.text
                        .foregroundStyle(Color.gray.mix(.teal, tuned))
                        .offset(
                            x: (1 - tuned) * staticNoise * 2,
                            y: (1 - tuned) * Motion.random(g.index, Int(t * 24) + 9) * 8 - 4 + tuned * g.wave(0.9, lag: 0.09) * 5
                        )
                        .opacity(tuned + (1 - tuned) * (0.35 + 0.4 * abs(staticNoise)))
                        .blur(radius: (1 - tuned) * 1.2)
                }
            }
        }
    }
}

#Preview {
    Channelling()
}
