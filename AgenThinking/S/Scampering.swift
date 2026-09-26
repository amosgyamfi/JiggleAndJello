//
//  Scampering.swift
//  AgenThinking
//  Meaning: Running with quick, light, darting steps.
//  Use case: When an agent zips between small tasks quickly.
//  Motion: The word darts in short, fast bursts to new spots and freezes, its letters pattering furiously only while it runs.
//

import SwiftUI

struct Scampering: View {
    private let hop = 0.7

    var body: some View {
        Clock { t in
            let round = Int(t / hop)
            let dash = Motion.smooth(Motion.phase(t, hop) / 0.2)
            let running = dash > 0 && dash < 1
            let from = spot(round)
            let to = spot(round + 1)
            Glyphs("Scampering", time: t) { g in
                let patter = running ? abs(sin(t * 40 + g.i * 1.3)) : 0
                g.text
                    .foregroundStyle(Color(red: 0.85, green: 0.75, blue: 0.65))
                    .offset(y: -3 * patter)
                    .rotationEffect(.degrees(running ? (to > from ? 8 : -8) : 0))
            }
            .offset(x: from + (to - from) * dash)
        }
    }

    private func spot(_ round: Int) -> Double {
        (Motion.random(round, 21) - 0.5) * 60
    }
}

#Preview {
    Scampering()
}
