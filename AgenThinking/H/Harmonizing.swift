//
//  Harmonizing.swift
//  AgenThinking
//  Meaning: Bringing different parts into agreement.
//  Use case: When an agent reconciles conflicting changes or aligns multiple sources.
//  Motion: Two voices of the word ride waves at a 3:2 ratio, drifting apart and repeatedly resolving into perfect unison.
//

import SwiftUI

struct Harmonizing: View {
    var body: some View {
        Clock { t in
            ZStack {
                Glyphs("Harmonizing", time: t) { g in
                    g.text
                        .foregroundStyle(Color(hue: 0.85 + 0.1 * g.progress, saturation: 0.5, brightness: 1))
                        .offset(y: sin(t * 3 - g.i * 0.45) * 6)
                        .opacity(0.45)
                }
                Glyphs("Harmonizing", time: t) { g in
                    g.text
                        .foregroundStyle(Color(hue: 0.5 + 0.12 * g.progress, saturation: 0.45, brightness: 1))
                        .offset(y: sin(t * 2 - g.i * 0.45) * 6)
                }
            }
            .blendMode(.plusLighter)
        }
    }
}

#Preview {
    Harmonizing()
}
