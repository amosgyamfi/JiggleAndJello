//
//  Fluttering.swift
//  AgenThinking
//  Meaning: Light, quick, wing-like movement.
//  Use case: When an agent flits between many small, quick lookups.
//  Motion: Letters flap like butterfly wings in 3-D, each on its own beat, while the word drifts on a floating path.
//

import SwiftUI

struct Fluttering: View {
    private let wings: [Color] = [.pink, .orange, .yellow, .mint]

    var body: some View {
        Clock { t in
            Glyphs("Fluttering", time: t) { g in
                let flap = sin((t * 3.2 + g.random() * 2) * 2 * .pi)
                g.text
                    .foregroundStyle(wings[g.index % wings.count])
                    .rotation3DEffect(.degrees(flap * 65), axis: (x: 0, y: 1, z: 0.15), perspective: 0.7)
                    .offset(y: g.wave(0.5, lag: 0.15) * 5 - abs(flap) * 2)
            }
            .offset(x: sin(t * 0.7) * 10, y: cos(t * 0.9) * 3)
        }
    }
}

#Preview {
    Fluttering()
}
