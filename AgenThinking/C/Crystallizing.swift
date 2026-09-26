//
//  Crystallizing.swift
//  AgenThinking
//  Meaning: A vague idea becoming clear and well-defined.
//  Use case: When an agent's plan or answer firms up from rough to precise.
//  Motion: Soft, tumbling letters snap in 15° steps into crisp icy type, each glinting as it locks into the lattice.
//

import SwiftUI

struct Crystallizing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            Glyphs("Crystallizing", time: t) { g in
                let start = g.random() * 0.4
                let set = Motion.window(beat, start, start + 0.2, 0.88, 1)
                let rawAngle = (1 - set) * (g.random(1) - 0.5) * 240
                let snapped = (rawAngle / 15).rounded() * 15
                let glint = Motion.window(beat, start + 0.15, start + 0.2, start + 0.22, start + 0.32)
                g.text
                    .foregroundStyle(Color.cyan.mix(.white, set))
                    .rotation3DEffect(.degrees(snapped), axis: (x: 1, y: 1, z: 0.3))
                    .blur(radius: (1 - set) * 3)
                    .opacity(0.35 + 0.65 * set)
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "sparkle")
                            .font(.system(size: 9))
                            .foregroundStyle(.white)
                            .scaleEffect(glint)
                            .offset(x: 3, y: -3)
                    }
            }
            .glow(.cyan.opacity(0.5), radius: 6)
        }
    }
}

#Preview {
    Crystallizing()
}
