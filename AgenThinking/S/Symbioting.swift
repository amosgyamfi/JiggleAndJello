//
//  Symbioting.swift
//  AgenThinking
//  Meaning: Two different things living together for mutual benefit.
//  Use case: When two agents or tools depend on each other, such as a coder and a reviewer.
//  Motion: The word's two halves lean toward each other and continually trade colors along a glowing link that passes between them.
//

import SwiftUI

struct Symbioting: View {
    var body: some View {
        Clock { t in
            let exchange = (sin(t * 1.4) + 1) / 2
            let courier = sin(t * 1.4)
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 5, height: 5)
                    .glow(Color.teal.mix(.orange, exchange), radius: 6)
                    .offset(x: courier * 36, y: 18)

                Glyphs("Symbioting", time: t) { g in
                    let left = g.index < 5
                    let lean = left ? g.progress : 1 - g.progress
                    g.text
                        .foregroundStyle(left ? Color.teal.mix(.orange, exchange) : Color.orange.mix(.teal, exchange))
                        .rotationEffect(.degrees((left ? 1 : -1) * 6 * lean * (0.5 + 0.5 * sin(t * 2.8))), anchor: .bottom)
                        .offset(x: (left ? 1 : -1) * 2 * lean)
                }
            }
        }
    }
}

#Preview {
    Symbioting()
}
