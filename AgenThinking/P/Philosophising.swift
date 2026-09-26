//
//  Philosophising.swift
//  AgenThinking
//  Meaning: Reflecting on big, abstract questions.
//  Use case: When an agent reasons about design principles or ethics rather than concrete code.
//  Motion: Marble-white serif italics turn slowly in deep 3-D perspective while quotation marks fade in and out like a quote.
//

import SwiftUI

struct Philosophising: View {
    var body: some View {
        Clock { t in
            let quote = (sin(t * 0.9) + 1) / 2
            HStack(spacing: 4) {
                Text("“").opacity(quote)
                Glyphs("Philosophising", time: t) { g in
                    g.text
                        .italic()
                        .foregroundStyle(Color(white: 0.85).mix(.white, g.pulse(0.25, lag: 0.05)))
                        .offset(y: g.wave(0.25, lag: 0.05) * 1.5)
                }
                Text("”").opacity(quote)
            }
            .fontDesign(.serif)
            .foregroundStyle(Color(white: 0.6))
            .rotation3DEffect(.degrees(sin(t * 0.5) * 28), axis: (x: 0.1, y: 1, z: 0), perspective: 0.8)
        }
    }
}

#Preview {
    Philosophising()
}
