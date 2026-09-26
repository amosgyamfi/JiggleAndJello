//
//  Whirlpooling.swift
//  AgenThinking
//  Meaning: Spinning rapidly in a vortex that draws things into its center.
//  Use case: When an agent pulls many threads into one focused result.
//  Motion: Letters spiral inward along a tightening vortex, shrinking and spinning into the center, then fan back out into the word.
//

import SwiftUI

struct Whirlpooling: View {
    private let letterWidth = 12.5

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            let suck = Motion.smooth(Motion.window(beat, 0.1, 0.5, 0.6, 0.95))
            ZStack {
                ForEach(0..<3, id: \.self) { k in
                    Ellipse()
                        .stroke(Color.cyan.opacity(0.25 * suck), lineWidth: 1)
                        .frame(width: 30 + Double(k) * 30, height: 10 + Double(k) * 10)
                        .rotationEffect(.degrees(t * (90 + Double(k) * 40)))
                }
                Glyphs("Whirlpooling", time: t) { g in
                    let homeX = (g.i - Double(g.count - 1) / 2) * letterWidth
                    let angle = suck * (4 * .pi + g.i * 0.5) + t * 2 * suck
                    let radius = 1 - suck
                    let spiralX = cos(angle) * abs(homeX) * radius * 0.9
                    let spiralY = sin(angle) * abs(homeX) * radius * 0.3
                    g.text
                        .foregroundStyle(Color.white.mix(.cyan, suck))
                        .rotationEffect(.radians(angle))
                        .scaleEffect(1 - 0.75 * suck)
                        .offset(x: (spiralX - homeX) * suck, y: spiralY * suck)
                        .opacity(1 - 0.5 * suck)
                }
            }
        }
    }
}

#Preview {
    Whirlpooling()
}
