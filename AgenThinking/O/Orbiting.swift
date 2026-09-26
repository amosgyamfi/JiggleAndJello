//
//  Orbiting.swift
//  AgenThinking
//  Meaning: Circling around a central subject.
//  Use case: When an agent repeatedly revisits the core of a problem from different angles.
//  Motion: A moon orbits the word on a tilted ellipse, passing behind and in front, lighting the letters it swings past.
//

import SwiftUI

struct Orbiting: View {
    private let word = "Orbiting"
    private let letterWidth = 15.0

    var body: some View {
        Clock { t in
            let angle = t * 1.6
            let x = cos(angle) * 110
            let y = sin(angle) * 20
            let front = sin(angle) > 0
            let depth = (sin(angle) + 1) / 2
            ZStack {
                Ellipse()
                    .stroke(.white.opacity(0.08), lineWidth: 1)
                    .frame(width: 220, height: 40)
                moon(depth).offset(x: x, y: y).opacity(front ? 0 : 1)

                Glyphs(word, time: t, spacing: 1) { g in
                    let letterX = (g.i - Double(g.count - 1) / 2) * letterWidth
                    let lit = Motion.bell((letterX - x) / 30) * (0.35 + 0.65 * depth)
                    g.text
                        .foregroundStyle(Color(white: 0.6).mix(.white, lit))
                        .shadow(color: .cyan.opacity(lit), radius: 8 * lit)
                }

                moon(depth).offset(x: x, y: y).opacity(front ? 1 : 0)
            }
        }
    }

    private func moon(_ depth: Double) -> some View {
        Circle()
            .fill(RadialGradient(colors: [.white, .cyan], center: .topLeading, startRadius: 0, endRadius: 10))
            .frame(width: 8 + 6 * depth, height: 8 + 6 * depth)
            .glow(.cyan, radius: 6)
            .opacity(0.4 + 0.6 * depth)
    }
}

#Preview {
    Orbiting()
}
