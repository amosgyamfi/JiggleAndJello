//
//  Galloping.swift
//  AgenThinking
//  Meaning: Racing ahead at full speed.
//  Use case: When an agent is moving quickly through a well-understood task.
//  Motion: Letters bound in a four-beat gallop rhythm rolling front to back, with the word leaning forward and surging.
//

import SwiftUI

struct Galloping: View {
    private let stride = 0.62

    var body: some View {
        Clock { t in
            let surge = sin(Motion.phase(t, stride) * 2 * .pi)
            Glyphs("Galloping", time: t) { g in
                let p = Motion.phase(t - (1 - g.progress) * 0.12, stride)
                let bound = Motion.hop(min(p / 0.42, 1)) + 0.35 * Motion.hop(Motion.ramp(p, 0.5, 0.72))
                g.text
                    .foregroundStyle(Color(red: 0.95, green: 0.62, blue: 0.35))
                    .offset(y: -10 * bound)
                    .rotationEffect(.degrees(-8 * bound))
            }
            .rotationEffect(.degrees(4))
            .offset(x: 3 * surge)
        }
    }
}

#Preview {
    Galloping()
}
