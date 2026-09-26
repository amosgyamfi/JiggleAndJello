//
//  Generating.swift
//  AgenThinking
//  Meaning: Producing new output token by token.
//  Use case: While a model streams its response.
//  Motion: Like ChatGPT streaming, letters fade up from blur one token at a time ahead of a pulsing dot cursor, then regenerate.
//

import SwiftUI

struct Generating: View {
    private let word = "Generating"
    private let period = 3.4

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let typed = min(max((beat - 0.05) / 0.55, 0), 1) * Double(word.count)
            let visible = min(word.count, Int(typed) + 1)
            HStack(spacing: 5) {
                Glyphs(String(word.prefix(visible)), time: t) { g in
                    let shown = min(max(typed - g.i, 0), 1)
                    g.text
                        .blur(radius: (1 - shown) * 4)
                        .offset(y: (1 - shown) * 4)
                        .opacity(shown)
                }
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
                    .scaleEffect(0.8 + 0.25 * sin(t * 8))
            }
            .frame(width: 160, alignment: .leading)
            .opacity(1 - Motion.ramp(beat, 0.88, 1))
        }
    }
}

#Preview {
    Generating()
}
