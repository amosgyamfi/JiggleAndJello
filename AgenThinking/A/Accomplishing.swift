//
//  Accomplishing.swift
//  AgenThinking
//  Meaning: Agent successfully finishing a task.
//  Use case: When an agent is reaching the final result.
//  Motion: Letters flip up from small and blue to full-size green one by one, then a seal of approval pops.
//

import SwiftUI

struct Accomplishing: View {
    private let word = "Accomplishing"
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period) * period
            let finished = Motion.window(beat, 1.9, 2.2, 3.2, 3.5)
            let fade = 1 - Motion.ramp(beat, 3.2, 3.5)

            HStack(spacing: 8) {
                Glyphs(word, time: t) { g in
                    let landed = beat - (0.2 + g.progress * 1.4)
                    let done = Motion.ramp(landed, 0, 0.3)
                    let settle = landed > 0 ? Motion.spring(landed / 0.9) : 0
                    g.text
                        .foregroundStyle(Color.blue.mix(.mint, done))
                        .scaleEffect(0.25 + 0.75 * done + 0.25 * settle)
                        .rotation3DEffect(.degrees((1 - done) * 180), axis: (x: 1, y: 1, z: 0.5))
                        .hueRotation(.degrees((1 - done) * 320))
                        .opacity(0.3 + 0.7 * done)
                }
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.mint)
                    .scaleEffect(finished * (1 + 0.3 * Motion.spring(Motion.ramp(beat, 1.9, 2.8))))
                    .rotationEffect(.degrees((1 - finished) * -90))
                    .glow(.mint, radius: 10 * finished)
            }
            .opacity(fade)
        }
    }
}

#Preview {
    Accomplishing()
}
