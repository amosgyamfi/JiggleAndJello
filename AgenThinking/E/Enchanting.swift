//
//  Enchanting.swift
//  AgenThinking
//  Meaning: Casting a spell; making something feel magical.
//  Use case: When an agent performs a delightful transformation, like generating an image or theme.
//  Motion: A wand tips while sparkles orbit the word, and floating letters glow and cycle through magical hues.
//

import SwiftUI

struct Enchanting: View {
    var body: some View {
        Clock { t in
            ZStack {
                ForEach(0..<7, id: \.self) { k in
                    let angle = t * 1.4 + Double(k) * 2 * .pi / 7
                    Image(systemName: "sparkle")
                        .font(.system(size: 7 + 5 * (sin(angle) + 1) / 2))
                        .foregroundStyle(.white)
                        .opacity(0.4 + 0.6 * (sin(angle) + 1) / 2)
                        .offset(x: cos(angle) * 110, y: sin(angle) * 24)
                }

                HStack(spacing: 6) {
                    Image(systemName: "wand.and.stars")
                        .foregroundStyle(.purple)
                        .rotationEffect(.degrees(sin(t * 2.5) * 18), anchor: .bottomLeading)
                    Glyphs("Enchanting", time: t) { g in
                        g.text
                            .foregroundStyle(Color(hue: 0.78 + 0.12 * g.wave(0.35, lag: 0.08), saturation: 0.55, brightness: 1))
                            .offset(y: g.wave(0.6, lag: 0.1) * 4)
                            .rotationEffect(.degrees(g.wave(0.6, lag: 0.1) * 5))
                    }
                    .glow(.purple, radius: 10)
                }
            }
        }
    }
}

#Preview {
    Enchanting()
}
