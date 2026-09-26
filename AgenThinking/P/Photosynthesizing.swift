//
//  Photosynthesizing.swift
//  AgenThinking
//  Meaning: Turning light into energy.
//  Use case: When an agent turns raw input into useful fuel, like embedding documents.
//  Motion: A sun rains light down onto dark-green letters, which absorb it, glow bright lime-gold, and release sparks of energy.
//

import SwiftUI

struct Photosynthesizing: View {
    var body: some View {
        Clock { t in
            let sun = (sin(t * 1.1) + 1) / 2
            ZStack {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.yellow)
                    .rotationEffect(.degrees(t * 30))
                    .offset(y: -40)
                    .glow(.yellow, radius: 6 * sun)

                Particles(10, time: t, period: 1.3) { k, life in
                    Capsule()
                        .fill(.yellow.opacity(0.6))
                        .frame(width: 1.2, height: 8)
                        .offset(x: (Motion.random(k, 1) - 0.5) * 180, y: -32 + life * 26)
                        .opacity(Motion.window(life, 0, 0.2, 0.7, 1) * (0.3 + 0.7 * sun))
                }

                Glyphs("Photosynthesizing", time: t) { g in
                    let absorb = (0.3 + 0.7 * sun) * g.pulse(0.7, lag: 0.07)
                    g.text
                        .foregroundStyle(Color(red: 0.1, green: 0.45, blue: 0.2).mix(Color(red: 0.8, green: 1, blue: 0.3), absorb))
                        .shadow(color: .green.opacity(absorb), radius: 6 * absorb)
                        .offset(y: 8)
                }
            }
        }
    }
}

#Preview {
    Photosynthesizing()
}
