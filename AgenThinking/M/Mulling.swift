//
//  Mulling.swift
//  AgenThinking
//  Meaning: Turning a thought over slowly in the mind.
//  Use case: When an agent re-reads a question before committing to an answer.
//  Motion: Each letter slowly rolls around its own small circle, out of phase with its neighbors, in warm spiced-wine tones.
//

import SwiftUI

struct Mulling: View {
    var body: some View {
        Clock { t in
            Glyphs("Mulling", time: t, spacing: 1) { g in
                let turn = t * 1.2 - g.i * 0.8
                g.text
                    .foregroundStyle(Color(red: 0.8, green: 0.25, blue: 0.3).mix(Color(red: 1, green: 0.7, blue: 0.4), (sin(turn) + 1) / 2))
                    .offset(x: cos(turn) * 2.5, y: sin(turn) * 3.5)
                    .rotationEffect(.degrees(cos(turn) * 8))
            }
        }
    }
}

#Preview {
    Mulling()
}
