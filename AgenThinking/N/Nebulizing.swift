//
//  Nebulizing.swift
//  AgenThinking
//  Meaning: Turning something into a fine, breathable mist.
//  Use case: When an agent breaks content into tiny pieces, like tokenizing or chunking text.
//  Motion: Shimmering aqua letters continuously shed a fine spray of droplets that drift up and away.
//

import SwiftUI

struct Nebulizing: View {
    var body: some View {
        Clock { t in
            ZStack {
                Glyphs("Nebulizing", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.55, green: 0.95, blue: 0.95))
                        .opacity(0.7 + 0.3 * g.noise(3))
                        .offset(x: g.noise(9, salt: 1) * 0.6)
                }

                Particles(28, time: t, period: 1.8) { k, life in
                    let spread = Motion.random(k, 2) - 0.5
                    Circle()
                        .fill(Color(red: 0.7, green: 1, blue: 1))
                        .frame(width: 2 + 2 * life, height: 2 + 2 * life)
                        .blur(radius: 1.5 * life)
                        .offset(
                            x: (Motion.random(k, 1) - 0.5) * 150 + (20 + spread * 30) * life,
                            y: -6 - 30 * life + spread * 8 * life
                        )
                        .opacity((1 - life) * 0.8)
                }
            }
        }
    }
}

#Preview {
    Nebulizing()
}
