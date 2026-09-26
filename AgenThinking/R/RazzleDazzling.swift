//
//  RazzleDazzling.swift
//  AgenThinking
//  Meaning: Dazzling with flashy showmanship.
//  Use case: When an agent presents a showy result, like a finished UI or demo.
//  Motion: A hue-cycling rainbow fill, a white glint sweep, and twinkling stars scattered around bouncing letters.
//

import SwiftUI

struct RazzleDazzling: View {
    var body: some View {
        Clock { t in
            ZStack {
                ForEach(0..<9, id: \.self) { k in
                    let twinkle = max(0, sin(t * (3 + Motion.random(k, 1) * 3) + Double(k)))
                    Image(systemName: "star.fill")
                        .font(.system(size: 6 + 6 * Motion.random(k, 2)))
                        .foregroundStyle(.white)
                        .scaleEffect(twinkle)
                        .rotationEffect(.degrees(t * 90))
                        .offset(x: (Motion.random(k, 3) - 0.5) * 230, y: (Motion.random(k, 4) - 0.5) * 70)
                }

                Glyphs("Razzle-dazzling", time: t) { g in
                    let pop = g.sweep(1.6, width: 0.12)
                    g.text
                        .scaleEffect(1 + 0.25 * pop)
                        .offset(y: -5 * pop)
                }
                .paint(LinearGradient(colors: [.pink, .orange, .yellow, .green, .cyan, .purple], startPoint: .leading, endPoint: .trailing))
                .hueRotation(.degrees(t * 120))
                .shimmer(t, period: 1.6, color: .white, width: 0.1)
            }
        }
    }
}

#Preview {
    RazzleDazzling()
}
