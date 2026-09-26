//
//  Contemplating.swift
//  AgenThinking
//  Meaning: Quiet, deep, unhurried reflection.
//  Use case: When an agent pauses to reflect before giving a considered answer.
//  Motion: The word breathes slowly; letter spacing inhales and exhales while the indigo tone brightens and dims.
//

import SwiftUI

struct Contemplating: View {
    var body: some View {
        Clock { t in
            let breath = (1 - cos(t * 2 * .pi / 5.5)) / 2
            Glyphs("Contemplating", time: t, spacing: 0.5 + 5 * breath) { g in
                g.text
                    .foregroundStyle(Color.indigo.mix(.white, 0.35 + 0.5 * breath))
                    .offset(y: -2 * breath * (1 - abs(g.centered)))
            }
            .opacity(0.55 + 0.45 * breath)
            .blur(radius: (1 - breath) * 0.6)
            .glow(.indigo, radius: 10 * breath)
        }
    }
}

#Preview {
    Contemplating()
}
