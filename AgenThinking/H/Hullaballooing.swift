//
//  Hullaballooing.swift
//  AgenThinking
//  Meaning: A noisy, joyful commotion.
//  Use case: Celebrating a big success, like all tests finally passing.
//  Motion: Confetti rains down while letters leap, spin, and flash loud colors in a riotous party.
//

import SwiftUI

struct Hullaballooing: View {
    private let confetti: [Color] = [.red, .yellow, .green, .cyan, .pink, .orange, .purple]

    var body: some View {
        Clock { t in
            ZStack {
                Particles(16, time: t, period: 2) { k, life in
                    Rectangle()
                        .fill(confetti[k % confetti.count])
                        .frame(width: 4, height: 7)
                        .rotation3DEffect(.degrees(life * 720), axis: (x: 1, y: Motion.random(k, 1), z: 0))
                        .offset(x: (Motion.random(k, 2) - 0.5) * 260 + sin(life * 6 + Double(k)) * 10, y: -60 + life * 120)
                }

                Glyphs("Hullaballooing", time: t) { g in
                    let period = 0.5 + g.random() * 0.4
                    let jump = Motion.hop(Motion.phase(t + g.random(1), period))
                    g.text
                        .foregroundStyle(confetti[(g.index + g.cycle(period)) % confetti.count])
                        .offset(y: -12 * jump)
                        .rotationEffect(.degrees((g.random(2) - 0.5) * 60 * jump))
                        .scaleEffect(1 + 0.2 * jump)
                }
            }
        }
    }
}

#Preview {
    Hullaballooing()
}
