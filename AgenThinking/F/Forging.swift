//
//  Forging.swift
//  AgenThinking
//  Meaning: Shaping something strong with heat and force.
//  Use case: When an agent hardens code: fixing edge cases, adding tests, or tightening types.
//  Motion: A hammer strikes; red-hot letters flash white, flatten, and throw sparks, then cool toward steel before the next blow.
//

import SwiftUI

struct Forging: View {
    private let period = 1.3

    var body: some View {
        Clock { t in
            let since = Motion.phase(t, period) * period
            let heat = exp(-since * 1.8)
            let impact = exp(-since * 9)
            HStack(spacing: 8) {
                ZStack {
                    Glyphs("Forging", time: t, spacing: 1) { g in
                        g.text
                            .foregroundStyle(Color(white: 0.55).mix(.red, heat).mix(.yellow, impact))
                            .scaleEffect(x: 1 + 0.12 * impact, y: 1 - 0.2 * impact, anchor: .bottom)
                    }
                    .glow(.orange.opacity(heat), radius: 10 * heat)

                    ForEach(0..<10, id: \.self) { k in
                        let angle = -Double.pi * Motion.random(k, 1)
                        let distance = 10 + 40 * (1 - exp(-since * 5)) * (0.5 + Motion.random(k, 2))
                        Circle()
                            .fill(.yellow)
                            .frame(width: 2.5, height: 2.5)
                            .offset(x: 30 + cos(angle) * distance, y: -4 + sin(angle) * distance + since * since * 30)
                            .opacity(max(0, 1 - since * 1.6))
                    }
                }

                Image(systemName: "hammer.fill")
                    .foregroundStyle(Color(white: 0.8))
                    .rotationEffect(.degrees(since < 0.08 ? -10 : -10 - 50 * Motion.ramp(since, 0.1, period)), anchor: .bottomTrailing)
            }
        }
    }
}

#Preview {
    Forging()
}
