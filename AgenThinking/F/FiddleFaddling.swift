//
//  FiddleFaddling.swift
//  AgenThinking
//  Meaning: Fussing over trivial details.
//  Use case: When an agent makes many tiny tweaks, like formatting or renaming.
//  Motion: Letters fidget constantly with tiny, quick nudges, tilts, and size tweaks that never settle.
//

import SwiftUI

struct FiddleFaddling: View {
    var body: some View {
        Clock { t in
            Glyphs("Fiddle-faddling", time: t) { g in
                g.text
                    .foregroundStyle(Color(red: 0.75, green: 1, blue: 0.7))
                    .rotationEffect(.degrees(g.noise(7) * 8))
                    .offset(x: g.noise(6, salt: 1) * 1.5, y: g.noise(8, salt: 2) * 2)
                    .scaleEffect(1 + g.noise(5, salt: 3) * 0.08)
            }
        }
    }
}

#Preview {
    FiddleFaddling()
}
