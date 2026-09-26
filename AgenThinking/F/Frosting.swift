//
//  Frosting.swift
//  AgenThinking
//  Meaning: Adding the finishing sweet layer on top.
//  Use case: When an agent adds the final polish: docs, comments, or a summary.
//  Motion: White icing pours over pink cake letters from the top, dripping to uneven lengths, while sprinkles twinkle.
//

import SwiftUI

struct Frosting: View {
    private let cake = Color(red: 1, green: 0.55, blue: 0.7)
    private let sprinkles: [Color] = [.yellow, .cyan, .mint, .orange]

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            Glyphs("Frosting", time: t, spacing: 1) { g in
                let pour = Motion.window(beat, g.progress * 0.3, g.progress * 0.3 + 0.3, 0.85, 1)
                let drip = pour * (0.4 + 0.5 * g.random())
                g.text
                    .foregroundStyle(cake)
                    .overlay(alignment: .top) {
                        g.text
                            .foregroundStyle(.white)
                            .mask(alignment: .top) {
                                Rectangle().frame(height: 30 * drip)
                            }
                    }
                    .overlay(alignment: .top) {
                        Capsule()
                            .fill(sprinkles[g.index % sprinkles.count])
                            .frame(width: 4, height: 1.5)
                            .rotationEffect(.degrees(g.random(2) * 180))
                            .offset(x: (g.random(3) - 0.5) * 8, y: 2)
                            .opacity(pour > 0.9 ? 1 : 0)
                    }
            }
        }
    }
}

#Preview {
    Frosting()
}
