//
//  Brewing.swift
//  AgenThinking
//  Meaning: Something good is steeping and will be ready soon.
//  Use case: While an agent waits on a slow request and the answer is taking shape.
//  Motion: Coffee-colored letters bob gently as if floating in a cup while wisps of steam curl up and fade.
//

import SwiftUI

struct Brewing: View {
    private let coffee = Color(red: 0.78, green: 0.52, blue: 0.32)
    private let cream = Color(red: 0.98, green: 0.9, blue: 0.78)

    var body: some View {
        Clock { t in
            ZStack {
                Particles(7, time: t, period: 2.6) { k, life in
                    Capsule()
                        .fill(.white.opacity(0.35))
                        .frame(width: 5, height: 16)
                        .blur(radius: 3)
                        .rotationEffect(.degrees(sin(life * 5 + Double(k)) * 30))
                        .offset(
                            x: (Motion.random(k, 1) - 0.5) * 120 + sin(life * 6 + Double(k)) * 6,
                            y: -8 - life * 34
                        )
                        .opacity(Motion.window(life, 0, 0.3, 0.5, 1))
                }

                Glyphs("Brewing", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(coffee.mix(cream, g.pulse(0.3, lag: 0.12)))
                        .offset(y: g.wave(0.6, lag: 0.12) * 2.5)
                        .rotationEffect(.degrees(g.wave(0.5, lag: 0.2) * 4))
                }
            }
        }
    }
}

#Preview {
    Brewing()
}
