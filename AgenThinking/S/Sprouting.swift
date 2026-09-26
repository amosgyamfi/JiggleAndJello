//
//  Sprouting.swift
//  AgenThinking
//  Meaning: Shooting up quickly with fresh growth.
//  Use case: When an agent rapidly spins up new files, branches, or ideas.
//  Motion: Letters shoot up out of the ground in sequence with a springy overshoot and a fresh leaf pops open on top.
//

import SwiftUI

struct Sprouting: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.2)
            VStack(spacing: 0) {
                Glyphs("Sprouting", time: t, spacing: 1) { g in
                    let start = 0.05 + g.progress * 0.4
                    let grow = Motion.ramp(beat, start, start + 0.1)
                    let boing = Motion.wobble(Motion.ramp(beat, start + 0.1, start + 0.4))
                    let leaf = Motion.ramp(beat, start + 0.12, start + 0.22)
                    let wither = 1 - Motion.ramp(beat, 0.9, 1)
                    g.text
                        .foregroundStyle(Color(red: 0.55, green: 1, blue: 0.5))
                        .scaleEffect(x: 1 - 0.2 * boing, y: (grow + 0.25 * boing) * wither, anchor: .bottom)
                        .overlay(alignment: .top) {
                            Image(systemName: "leaf.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(.green)
                                .rotationEffect(.degrees(g.isEven ? -30 : 30))
                                .scaleEffect(leaf * wither)
                                .offset(y: -6)
                        }
                }
                Capsule()
                    .fill(Color(red: 0.4, green: 0.3, blue: 0.2))
                    .frame(width: 170, height: 3)
            }
        }
    }
}

#Preview {
    Sprouting()
}
