//
//  Lollygagging.swift
//  AgenThinking
//  Meaning: Lazing around aimlessly.
//  Use case: When an agent is waiting in a queue or rate-limited.
//  Motion: Letters slouch and lean on each other in slow motion, one occasionally stretches in a yawn, and z's drift away.
//

import SwiftUI

struct Lollygagging: View {
    var body: some View {
        Clock { t in
            let yawner = Int(t / 3) % 12
            let yawn = Motion.window(Motion.phase(t, 3), 0.2, 0.5, 0.6, 0.9)
            ZStack {
                Glyphs("Lollygagging", time: t) { g in
                    let slouch = g.noise(0.25)
                    let yawning = g.index == yawner ? yawn : 0
                    g.text
                        .foregroundStyle(Color(white: 0.7).mix(.yellow, 0.4 * yawning))
                        .scaleEffect(x: 1, y: 0.92 + 0.35 * yawning, anchor: .bottom)
                        .rotationEffect(.degrees(slouch * 16 * (1 - yawning)), anchor: .bottom)
                        .offset(y: 2 + abs(slouch) * 2)
                }

                Particles(3, time: t, period: 3) { k, life in
                    Text("z")
                        .font(.system(size: 10 + Double(k) * 3, weight: .bold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.6))
                        .offset(x: 90 + life * 20, y: -8 - life * 26)
                        .opacity(Motion.window(life, 0, 0.2, 0.6, 1))
                }
            }
        }
    }
}

#Preview {
    Lollygagging()
}
