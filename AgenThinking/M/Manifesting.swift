//
//  Manifesting.swift
//  AgenThinking
//  Meaning: Willing something into existence.
//  Use case: When an agent's intent turns into a visible result, like a generated file appearing.
//  Motion: A golden ring pulses outward and a radial mask reveals the word from its center while motes of light rise.
//

import SwiftUI

struct Manifesting: View {
    private let gold = Color(red: 1, green: 0.84, blue: 0.45)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            let reveal = Motion.window(beat, 0.05, 0.5, 0.85, 1)
            let ring = Motion.ramp(beat, 0, 0.6)
            ZStack {
                Ellipse()
                    .stroke(gold.opacity(1 - ring), lineWidth: 2)
                    .frame(width: 240 * ring, height: 84 * ring)

                Particles(10, time: t, period: 2) { k, life in
                    Circle()
                        .fill(gold)
                        .frame(width: 3, height: 3)
                        .offset(x: (Motion.random(k, 1) - 0.5) * 180, y: 24 - life * 50)
                        .opacity(Motion.window(life, 0, 0.2, 0.6, 1) * reveal)
                }

                Glyphs("Manifesting", time: t) { g in
                    g.text.foregroundStyle(gold.mix(.white, g.pulse(0.6, lag: 0.08) * 0.6))
                }
                .glow(gold.opacity(0.6), radius: 8)
                .mask {
                    Ellipse()
                        .frame(width: 320 * reveal, height: 90 * reveal)
                        .blur(radius: 12)
                }
            }
        }
    }
}

#Preview {
    Manifesting()
}
