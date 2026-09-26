//
//  Unfurling.swift
//  AgenThinking
//  Meaning: Spreading or unrolling out from a rolled-up state, like a flag or a fern.
//  Use case: When an agent expands a collapsed plan or reveals a long answer.
//  Motion: Letters unroll one after another from edge-on 3-D hinges at their leading edge, like a banner rolling open, then roll back up.
//

import SwiftUI

struct Unfurling: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            Glyphs("Unfurling", time: t, spacing: 1) { g in
                let open = Motion.window(beat, 0.04 + g.progress * 0.36, 0.14 + g.progress * 0.36, 0.84 + g.progress * 0.08, 0.92 + g.progress * 0.08)
                g.text
                    .foregroundStyle(Color(red: 0.95, green: 0.4, blue: 0.4).mix(Color(red: 1, green: 0.85, blue: 0.5), g.progress))
                    .rotation3DEffect(.degrees(90 * (1 - Motion.smooth(open))), axis: (x: 0, y: 1, z: 0), anchor: .leading, perspective: 0.7)
                    .opacity(0.15 + 0.85 * open)
            }
        }
    }
}

#Preview {
    Unfurling()
}
