//
//  Wibbling.swift
//  AgenThinking
//  Meaning: Wobbling like jelly; also, rambling on at length.
//  Use case: When an agent is uncertain and its answer wobbles.
//  Motion: Each letter gets a gelatin poke and jiggles with out-of-phase horizontal and vertical squash that settles, rippling through the word.
//

import SwiftUI

struct Wibbling: View {
    var body: some View {
        Clock { t in
            Glyphs("Wibbling", time: t, spacing: 1) { g in
                let p = g.phase(2, lag: 0.07)
                let jiggle = Motion.wobble(p, bounces: 5)
                g.text
                    .foregroundStyle(Color(red: 0.55, green: 1, blue: 0.7).mix(.white, 0.4 * abs(jiggle)))
                    .scaleEffect(x: 1 + 0.18 * jiggle, y: 1 - 0.18 * jiggle, anchor: .bottom)
                    .rotationEffect(.degrees(5 * Motion.wobble(Motion.ramp(p, 0.04, 1), bounces: 3.5)), anchor: .bottom)
            }
        }
    }
}

#Preview {
    Wibbling()
}
