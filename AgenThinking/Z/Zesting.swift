//
//  Zesting.swift
//  AgenThinking
//  Meaning: Grating citrus peel to add a bright, tangy flavor.
//  Use case: When an agent adds finishing touches that make the result pop.
//  Motion: A grater sweeps along the word; letters flick as it passes and throw off bright yellow-green zest flakes that tumble down.
//

import SwiftUI

struct Zesting: View {
    private let period = 1.8

    var body: some View {
        Clock { t in
            let pass = Motion.phase(t, period) * 1.3 - 0.15
            ZStack {
                Particles(16, time: t, period: 0.9) { k, life in
                    let birthPass = Motion.phase(t - life * 0.9, period) * 1.3 - 0.15
                    RoundedRectangle(cornerRadius: 1)
                        .fill(Motion.random(k, 5) > 0.5 ? Color.yellow : Color(red: 0.6, green: 1, blue: 0.3))
                        .frame(width: 3, height: 2)
                        .rotationEffect(.degrees(life * 540 * (Motion.random(k, 6) - 0.5)))
                        .offset(x: (birthPass - 0.5) * 150 + (Motion.random(k, 1) - 0.5) * 24, y: 4 + 34 * life * life)
                        .opacity((1 - life) * Motion.window(birthPass, -0.1, 0, 1, 1.1))
                }
                Glyphs("Zesting", time: t, spacing: 1) { g in
                    let hit = Motion.bell((g.progress - pass) / 0.1)
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.92, blue: 0.35).mix(Color(red: 0.7, green: 1, blue: 0.4), hit))
                        .offset(y: -4 * hit)
                        .rotationEffect(.degrees(12 * hit))
                }
                Image(systemName: "square.grid.3x3.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(Color(white: 0.7))
                    .rotationEffect(.degrees(-20))
                    .offset(x: (pass - 0.5) * 150, y: -26)
            }
        }
    }
}

#Preview {
    Zesting()
}
