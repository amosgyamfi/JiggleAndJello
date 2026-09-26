//
//  Boogieing.swift
//  AgenThinking
//  Meaning: Dancing energetically, full of good vibes.
//  Use case: When an agent is in a productive, high-energy streak.
//  Motion: Letters rock left and right on the beat with a hop while disco colors cycle through the rainbow.
//

import SwiftUI

struct Boogieing: View {
    var body: some View {
        Clock { t in
            Glyphs("Boogieing", time: t) { g in
                let sway = sin(t * 2 * .pi)
                let hop = abs(sin(t * 2 * .pi))
                g.text
                    .foregroundStyle(Color(hue: Motion.phase(g.progress * 0.6 + t * 0.35, 1), saturation: 0.7, brightness: 1))
                    .rotationEffect(.degrees((g.isEven ? 1 : -1) * 16 * sway), anchor: .bottom)
                    .offset(y: -8 * hop)
                    .scaleEffect(1 + 0.08 * hop)
            }
            .glow(.pink.opacity(0.5), radius: 8)
        }
    }
}

#Preview {
    Boogieing()
}
