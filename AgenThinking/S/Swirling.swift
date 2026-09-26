//
//  Swirling.swift
//  AgenThinking
//  Meaning: Spinning around in eddies and whorls.
//  Use case: When an agent mixes many inputs together, like blending search results.
//  Motion: A rotating angular gradient swirls through the word while letters loop around their positions in widening eddies.
//

import SwiftUI

struct Swirling: View {
    var body: some View {
        Clock { t in
            let radius = 1.5 + 3 * (sin(t * 0.8) + 1) / 2
            Glyphs("Swirling", time: t, spacing: 1) { g in
                let angle = t * 3 + g.i * 0.8
                g.text
                    .offset(x: cos(angle) * radius, y: sin(angle) * radius)
                    .rotationEffect(.radians(sin(angle) * 0.2))
            }
            .paint(AngularGradient(colors: [.teal, .purple, .pink, .teal], center: .center, angle: .degrees(t * 140)))
        }
    }
}

#Preview {
    Swirling()
}
