//
//  Ionizing.swift
//  AgenThinking
//  Meaning: Charging something up by stripping away electrons.
//  Use case: When an agent energizes a process, like warming caches or priming a model.
//  Motion: Plasma-charged letters flicker with a pulsing halo while electrons are stripped off and fly away.
//

import SwiftUI

struct Ionizing: View {
    var body: some View {
        Clock { t in
            let charge = (sin(t * 3) + 1) / 2
            ZStack {
                Particles(12, time: t, period: 1.1) { k, life in
                    let angle = Motion.random(k, Int(t / 1.1 + Motion.random(k, 7_331))) * 2 * .pi
                    let origin = (Motion.random(k, 3) - 0.5) * 140
                    Circle()
                        .fill(.cyan)
                        .frame(width: 3, height: 3)
                        .glow(.cyan, radius: 4)
                        .offset(x: origin + cos(angle) * 40 * life, y: sin(angle) * 30 * life)
                        .opacity(1 - life)
                }

                Glyphs("Ionizing", time: t, spacing: 1) { g in
                    let flicker = Motion.random(g.index, Int(t * 20)) * 0.25
                    g.text
                        .foregroundStyle(Color(red: 0.6, green: 0.7, blue: 1).mix(.white, charge * 0.5 + flicker))
                }
                .glow(Color(red: 0.5, green: 0.4, blue: 1), radius: 6 + 10 * charge)
            }
        }
    }
}

#Preview {
    Ionizing()
}
