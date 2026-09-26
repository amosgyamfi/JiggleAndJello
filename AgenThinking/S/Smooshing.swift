//
//  Smooshing.swift
//  AgenThinking
//  Meaning: Squashing things together.
//  Use case: When an agent compresses, minifies, or squashes commits.
//  Motion: The word gets squeezed from both ends into a tight overlapping squish, then springs back out with a wobble.
//

import SwiftUI

struct Smooshing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 2.2)
            let squeeze = beat < 0.45 ? Motion.smooth(beat / 0.45) : Motion.spring((beat - 0.45) / 0.55, bounces: 2.5)
            Glyphs("Smooshing", time: t, spacing: -7 * squeeze) { g in
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.65, blue: 0.8).mix(.white, 1 - abs(squeeze)))
                    .scaleEffect(x: 1 - 0.3 * squeeze, y: 1 + 0.15 * squeeze * (1 - abs(g.centered)), anchor: .bottom)
            }
        }
    }
}

#Preview {
    Smooshing()
}
