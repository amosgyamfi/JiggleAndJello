//
//  Frolicking.swift
//  AgenThinking
//  Meaning: Playing about happily and carefree.
//  Use case: When an agent explores creatively with low stakes, like brainstorming.
//  Motion: Letters bounce like rubber balls at their own tempo, stretching in the air and squashing on every landing.
//

import SwiftUI

struct Frolicking: View {
    var body: some View {
        Clock { t in
            Glyphs("Frolicking", time: t) { g in
                let period = 0.8 + g.random() * 0.5
                let local = Motion.phase(t + g.random(1), period)
                let air = Motion.hop(local)
                let squash = Motion.bell(min(local, 1 - local) / 0.08)
                g.text
                    .foregroundStyle(Color(hue: g.progress, saturation: 0.5, brightness: 1))
                    .scaleEffect(x: 1 + 0.25 * squash - 0.08 * air, y: 1 - 0.28 * squash + 0.12 * air, anchor: .bottom)
                    .offset(y: -16 * air)
            }
        }
    }
}

#Preview {
    Frolicking()
}
