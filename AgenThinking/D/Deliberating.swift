//
//  Deliberating.swift
//  AgenThinking
//  Meaning: Debating both sides before reaching a verdict.
//  Use case: When an agent evaluates pros and cons or competing hypotheses.
//  Motion: Alternating orange and blue letters trade places up and down like two sides arguing, then settle into white agreement.
//

import SwiftUI

struct Deliberating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4.2)
            let debate = 1 - Motion.window(beat, 0.62, 0.75, 0.92, 1)
            let side = sin(t * 1.6 * .pi)
            Glyphs("Deliberating", time: t) { g in
                let camp: Double = g.isEven ? 1 : -1
                g.text
                    .foregroundStyle((g.isEven ? Color.orange : .blue).mix(.white, 1 - debate))
                    .offset(y: camp * 7 * side * debate)
                    .scaleEffect(1 + 0.08 * max(0, camp * side) * debate)
            }
        }
    }
}

#Preview {
    Deliberating()
}
