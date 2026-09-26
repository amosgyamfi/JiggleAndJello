//
//  Seasoning.swift
//  AgenThinking
//  Meaning: Adding just the right amount of flavor.
//  Use case: When an agent tunes parameters, tone, or style to taste.
//  Motion: A shaker jiggles overhead and a sprinkle of salt and pepper falls onto the letters, which warm in color as they are seasoned.
//

import SwiftUI

struct Seasoning: View {
    var body: some View {
        Clock { t in
            let shake = sin(t * 18) * Motion.window(Motion.phase(t, 2), 0, 0.05, 0.4, 0.5)
            let seasoned = (1 - cos(t * 2 * .pi / 6)) / 2
            ZStack {
                VStack(spacing: 1) {
                    Capsule().fill(Color(white: 0.7)).frame(width: 12, height: 3)
                    RoundedRectangle(cornerRadius: 3).fill(.white).frame(width: 12, height: 15)
                }
                .rotationEffect(.degrees(160 + 12 * shake))
                .offset(x: 30 * shake / 2, y: -38)

                Particles(18, time: t, period: 1.2) { k, life in
                    Circle()
                        .fill(k.isMultiple(of: 3) ? Color(white: 0.3) : .white)
                        .frame(width: 2, height: 2)
                        .offset(x: (Motion.random(k, 1) - 0.5) * 70, y: -28 + life * 36)
                        .opacity(Motion.window(life, 0, 0.1, 0.8, 1))
                }

                Glyphs("Seasoning", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.9, green: 0.95, blue: 0.85).mix(Color(red: 1, green: 0.6, blue: 0.3), seasoned * (1 - abs(g.centered) * 0.6)))
                        .offset(y: 8)
                }
            }
        }
    }
}

#Preview {
    Seasoning()
}
