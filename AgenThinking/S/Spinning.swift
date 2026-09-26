//
//  Spinning.swift
//  AgenThinking
//  Meaning: Turning around and around.
//  Use case: The classic loading spinner, as a word.
//  Motion: A wave of full 360° spins travels through the letters, each one tinted by its rotation.
//

import SwiftUI

struct Spinning: View {
    var body: some View {
        Clock { t in
            Glyphs("Spinning", time: t, spacing: 1) { g in
                let spin = Motion.smooth(Motion.ramp(g.phase(1.8, lag: 0.08), 0, 0.45))
                g.text
                    .foregroundStyle(Color(hue: 0.55 + 0.3 * sin(spin * .pi), saturation: 0.5 * sin(spin * .pi), brightness: 1))
                    .rotationEffect(.degrees(spin * 360))
                    .scaleEffect(1 + 0.15 * sin(spin * .pi))
            }
        }
    }
}

#Preview {
    Spinning()
}
