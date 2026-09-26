//
//  Slithering.swift
//  AgenThinking
//  Meaning: Gliding smoothly with a sinuous, snake-like motion.
//  Use case: When an agent weaves through tight spaces, like navigating a complex codebase.
//  Motion: A tight S-curve travels down the word's scaly green body, each letter turning with the curve's tangent.
//

import SwiftUI

struct Slithering: View {
    private let amplitude = 6.0
    private let wavelength = 60.0
    private let letterWidth = 14.0

    var body: some View {
        Clock { t in
            Glyphs("Slithering", time: t) { g in
                let theta = g.i * letterWidth / wavelength * 2 * .pi - t * 7
                let slope = amplitude * 2 * .pi / wavelength * cos(theta)
                g.text
                    .foregroundStyle(g.isEven ? Color(red: 0.4, green: 0.85, blue: 0.4) : Color(red: 0.7, green: 0.95, blue: 0.3))
                    .offset(y: amplitude * sin(theta))
                    .rotationEffect(.radians(atan(slope)))
            }
            .offset(x: sin(t * 0.8) * 10)
        }
    }
}

#Preview {
    Slithering()
}
