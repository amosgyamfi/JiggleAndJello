//
//  Concocting.swift
//  AgenThinking
//  Meaning: Mixing ingredients into something new, like a potion.
//  Use case: When an agent combines several tools or data sources into a novel solution.
//  Motion: Letters bob unpredictably in a bubbling cauldron, shifting from potion green to violet as bubbles rise.
//

import SwiftUI

struct Concocting: View {
    var body: some View {
        Clock { t in
            ZStack {
                Particles(9, time: t, period: 1.8) { k, life in
                    Circle()
                        .strokeBorder(Color.green.mix(.purple, Motion.random(k, 4)).opacity(0.8), lineWidth: 1.2)
                        .frame(width: 5 + Motion.random(k, 5) * 7)
                        .offset(x: (Motion.random(k, 6) - 0.5) * 150, y: 20 - life * 44)
                        .opacity(Motion.window(life, 0, 0.15, 0.7, 1))
                }

                HStack(spacing: 6) {
                    Image(systemName: "testtube.2")
                        .foregroundStyle(.green)
                        .rotationEffect(.degrees(sin(t * 3) * 12))
                    Glyphs("Concocting", time: t) { g in
                        g.text
                            .foregroundStyle(Color(hue: 0.33 + 0.45 * (sin(t * 0.9 + g.i * 0.4) + 1) / 2, saturation: 0.7, brightness: 1))
                            .offset(y: g.noise(1.6) * 5)
                            .rotationEffect(.degrees(g.noise(1.2, salt: 2) * 10))
                    }
                }
            }
        }
    }
}

#Preview {
    Concocting()
}
