//
//  Simmering.swift
//  AgenThinking
//  Meaning: Staying just below the boil; quietly active.
//  Use case: When an agent keeps a low-intensity task running, like watching for changes.
//  Motion: Letters tremble in a faint heat haze over a slow red glow while small bubbles pop along the surface.
//

import SwiftUI

struct Simmering: View {
    var body: some View {
        Clock { t in
            let heat = (sin(t * 1.2) + 1) / 2
            VStack(spacing: 2) {
                Glyphs("Simmering", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.75, blue: 0.6).mix(.red, 0.3 * heat))
                        .offset(y: sin(t * 9 + g.i * 1.7) * 0.8)
                        .scaleEffect(x: 1 + sin(t * 7 + g.i) * 0.03, y: 1)
                }
                .glow(.red.opacity(0.3 + 0.4 * heat), radius: 8)

                ZStack {
                    Capsule().fill(.red.opacity(0.3)).frame(width: 170, height: 2)
                    Particles(6, time: t, period: 1.5) { k, life in
                        Circle()
                            .stroke(.white.opacity(0.7), lineWidth: 1)
                            .frame(width: 3 + 5 * life, height: 3 + 5 * life)
                            .offset(x: (Motion.random(k, Int(t / 1.5 + Motion.random(k, 7_331))) - 0.5) * 160, y: -2 * life)
                            .opacity(life < 0.8 ? life / 0.8 : 0)
                    }
                }
            }
        }
    }
}

#Preview {
    Simmering()
}
