//
//  Scurrying.swift
//  AgenThinking
//  Meaning: Hurrying about in many directions at once.
//  Use case: When an agent fans out many parallel requests or sub-tasks.
//  Motion: Like startled ants, letters dash off in random directions at random moments, then scurry back into place.
//

import SwiftUI

struct Scurrying: View {
    var body: some View {
        Clock { t in
            Glyphs("Scurrying", time: t) { g in
                let period = 1.4 + g.random() * 0.8
                let local = Motion.phase(t + g.random(1) * period, period)
                let round = g.cycle(period, lag: -g.random(1) * period)
                let out = Motion.window(local, 0, 0.12, 0.3, 0.45)
                let angle = Motion.random(g.index, round) * 2 * .pi
                let legs = out > 0 ? sin(t * 50) * 10 : 0
                g.text
                    .foregroundStyle(Color(red: 0.95, green: 0.55, blue: 0.4))
                    .rotationEffect(.degrees(legs))
                    .offset(x: cos(angle) * 16 * out, y: sin(angle) * 14 * out)
            }
        }
    }
}

#Preview {
    Scurrying()
}
