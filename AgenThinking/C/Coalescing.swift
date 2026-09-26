//
//  Coalescing.swift
//  AgenThinking
//  Meaning: Separate pieces coming together into one whole.
//  Use case: When an agent merges results from several searches or sub-tasks.
//  Motion: Blurred letters scattered across the card drift together into the word, hold, then scatter somewhere new.
//

import SwiftUI

struct Coalescing: View {
    private let period = 4.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let round = Int(t / period) + (beat > 0.82 ? 1 : 0)
            Glyphs("Coalescing", time: t) { g in
                let join = Motion.window(beat, 0.05 + g.random(round) * 0.1, 0.45, 0.82, 1)
                let apart = 1 - join
                g.text
                    .foregroundStyle(Color.indigo.mix(.white, join))
                    .rotationEffect(.degrees(apart * (g.random(round + 1) - 0.5) * 180))
                    .offset(
                        x: apart * (g.random(round + 2) - 0.5) * 160,
                        y: apart * (g.random(round + 3) - 0.5) * 70
                    )
                    .blur(radius: apart * 3)
                    .opacity(0.3 + 0.7 * join)
            }
        }
    }
}

#Preview {
    Coalescing()
}
