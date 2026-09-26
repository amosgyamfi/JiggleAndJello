//
//  Pouncing.swift
//  AgenThinking
//  Meaning: Leaping on an opportunity the instant it appears.
//  Use case: When an agent spots the bug or answer and jumps on it immediately.
//  Motion: Like a cat, the word crouches low, wiggles, springs forward in a stretched arc, lands with a squash, then creeps back.
//

import SwiftUI

struct Pouncing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 2.6)
            let crouch = Motion.window(beat, 0, 0.15, 0.36, 0.42)
            let wiggle = sin(t * 30) * Motion.window(beat, 0.15, 0.2, 0.32, 0.38)
            let leap = Motion.ramp(beat, 0.4, 0.58)
            let land = Motion.window(beat, 0.58, 0.61, 0.63, 0.72)
            let back = Motion.ramp(beat, 0.72, 1)
            let x = leap * 36 * (1 - back) - 18
            let y = -22 * Motion.hop(leap)
            Glyphs("Pouncing", time: t, spacing: 1) { g in
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.7, blue: 0.35))
                    .rotationEffect(.degrees(wiggle * 6 * (1 - g.progress)), anchor: .bottom)
            }
            .scaleEffect(
                x: 1 + 0.08 * crouch + 0.12 * (leap > 0 && leap < 1 ? 1 : 0) + 0.12 * land,
                y: 1 - 0.25 * crouch - 0.2 * land,
                anchor: .bottom
            )
            .rotationEffect(.degrees(leap > 0 && leap < 1 ? -8 + 16 * leap : 0))
            .offset(x: x, y: y)
        }
    }
}

#Preview {
    Pouncing()
}
