//
//  Actioning.swift
//  AgenThinking
//  Meaning: An agent handling or processing a task.
//  Use case: During an agent's task execution, addressing an issue or at the start of implementing a task.
//  Motion: A play button fires, then a fast staggered 3-D flip ripples through the letters like a "go" signal.
//

import SwiftUI

struct Actioning: View {
    private let word = "Actioning"
    private let period = 2.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let press = Motion.window(beat, 0, 0.05, 0.12, 0.3)

            HStack(spacing: 10) {
                Image(systemName: "play.fill")
                    .foregroundStyle(.cyan)
                    .scaleEffect(1 - 0.35 * press)
                    .glow(.cyan, radius: 12 * press)

                Glyphs(word, time: t) { g in
                    let flip = Motion.ramp(beat, 0.1 + g.progress * 0.35, 0.35 + g.progress * 0.35)
                    let mid = sin(flip * .pi)
                    g.text
                        .foregroundStyle(Color.blue.mix(.cyan, mid))
                        .scaleEffect(1 - 0.5 * mid)
                        .rotation3DEffect(.degrees(flip * 360), axis: (x: -1, y: 0, z: 0), perspective: 0.6)
                        .hueRotation(.degrees(mid * 90))
                        .offset(x: 6 * mid)
                }
            }
        }
    }
}

#Preview {
    Actioning()
}
