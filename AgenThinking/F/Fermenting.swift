//
//  Fermenting.swift
//  AgenThinking
//  Meaning: Slowly transforming over time through a quiet, living process.
//  Use case: When an agent runs a slow background job whose result improves the longer it runs.
//  Motion: Letters slowly age from grape purple to deep wine while fizzy bubbles rise through them and the letters gently foam.
//

import SwiftUI

struct Fermenting: View {
    var body: some View {
        Clock { t in
            let age = (1 - cos(t * 2 * .pi / 7)) / 2
            ZStack {
                Glyphs("Fermenting", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.62, green: 0.4, blue: 0.95).mix(Color(red: 0.85, green: 0.15, blue: 0.3), age))
                        .scaleEffect(1 + 0.06 * g.noise(0.8))
                        .offset(y: g.noise(0.6, salt: 2) * 1.5)
                }

                Particles(14, time: t, period: 1.6) { k, life in
                    Circle()
                        .fill(.white.opacity(0.7))
                        .frame(width: 2 + Motion.random(k, 8) * 2.5)
                        .offset(x: (Motion.random(k, 9) - 0.5) * 170 + sin(life * 9 + Double(k)) * 2, y: 14 - life * 30)
                        .opacity(Motion.window(life, 0, 0.2, 0.7, 1))
                }
            }
        }
    }
}

#Preview {
    Fermenting()
}
