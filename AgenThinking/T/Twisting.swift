//
//  Twisting.swift
//  AgenThinking
//  Meaning: Turning or wringing something around its own axis.
//  Use case: When an agent reframes a problem or applies a transform.
//  Motion: The word twists like a wrung ribbon; each letter tilts back and forth in 3-D around the horizontal axis with a phase offset, so a helix-like twist travels along it.
//

import SwiftUI

struct Twisting: View {
    var body: some View {
        Clock { t in
            Glyphs("Twisting", time: t, spacing: 1) { g in
                let angle = sin(t * 1.8 - g.i * 0.45) * 75
                let facing = cos(angle * .pi / 180)
                g.text
                    .foregroundStyle(Color(red: 0.5, green: 0.85, blue: 1).mix(Color(red: 0.95, green: 0.5, blue: 1), 1 - facing))
                    .rotation3DEffect(.degrees(angle), axis: (x: 1, y: 0, z: 0), perspective: 0.5)
            }
        }
    }
}

#Preview {
    Twisting()
}
