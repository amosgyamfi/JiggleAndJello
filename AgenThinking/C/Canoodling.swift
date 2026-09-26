//
//  Canoodling.swift
//  AgenThinking
//  Meaning: Snuggling up affectionately.
//  Use case: When an agent pairs related items together, like matching tests to code.
//  Motion: Letters pair up and lean into each other in turn while little hearts float from the couples.
//

import SwiftUI

struct Canoodling: View {
    var body: some View {
        Clock { t in
            ZStack {
                Glyphs("Canoodling", time: t) { g in
                    let pair = Double(g.index / 2)
                    let lean = (sin((t * 0.8 - pair * 0.22) * 2 * .pi) + 1) / 2
                    let toward: Double = g.isEven ? 1 : -1
                    g.text
                        .foregroundStyle(Color.pink.mix(.white, 0.35 - 0.3 * lean))
                        .rotationEffect(.degrees(toward * 8 * lean), anchor: .bottom)
                        .offset(x: toward * 1.2 * lean)
                }

                Particles(5, time: t, period: 2.8) { k, life in
                    Image(systemName: "heart.fill")
                        .font(.system(size: 9 + Motion.random(k, 2) * 5))
                        .foregroundStyle(.pink)
                        .offset(x: (Motion.random(k, 3) - 0.5) * 130 + sin(life * 8) * 4, y: -8 - life * 30)
                        .opacity(Motion.window(life, 0, 0.2, 0.6, 1))
                        .scaleEffect(0.6 + 0.6 * life)
                }
            }
        }
    }
}

#Preview {
    Canoodling()
}
