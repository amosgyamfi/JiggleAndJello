//
//  Whisking.swift
//  AgenThinking
//  Meaning: Beating quickly with a whisk to add air; also, moving something away swiftly.
//  Use case: When an agent quickly mixes and blends inputs.
//  Motion: Letters whip around fast figure-eight loops while airy froth bubbles float up around the word.
//

import SwiftUI

struct Whisking: View {
    var body: some View {
        Clock { t in
            ZStack {
                Particles(12, time: t, period: 1.8) { k, life in
                    Circle()
                        .fill(.white.opacity(0.5 * (1 - life)))
                        .frame(width: 3 + 4 * Motion.random(k, 3))
                        .offset(x: (Motion.random(k, 1) - 0.5) * 150, y: 12 - 36 * life)
                }
                Glyphs("Whisking", time: t, spacing: 1) { g in
                    let a = t * 9 + g.i * 0.9
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.95, blue: 0.8))
                        .offset(x: sin(a) * 3, y: sin(2 * a) * 2.5)
                        .rotationEffect(.degrees(cos(a) * 8))
                }
            }
        }
    }
}

#Preview {
    Whisking()
}
