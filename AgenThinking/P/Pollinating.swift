//
//  Pollinating.swift
//  AgenThinking
//  Meaning: Carrying something from one place to another so new things can grow.
//  Use case: When an agent carries insights or patterns from one file or project into another.
//  Motion: A bee zips a figure-eight over the word, and every letter it passes blooms pink before fading back.
//

import SwiftUI

struct Pollinating: View {
    private let letterWidth = 15.0

    var body: some View {
        Clock { t in
            let bee = beePosition(t)
            ZStack {
                Glyphs("Pollinating", time: t) { g in
                    let letterX = (g.i - Double(g.count - 1) / 2) * letterWidth
                    let bloom = bloomAmount(at: letterX, time: t)
                    g.text
                        .foregroundStyle(Color(red: 0.7, green: 0.9, blue: 0.5).mix(.pink, bloom))
                        .scaleEffect(1 + 0.18 * bloom)
                        .rotationEffect(.degrees(8 * bloom))
                }

                ZStack {
                    HStack(spacing: 0) {
                        Ellipse().fill(.white.opacity(0.7)).frame(width: 6, height: 4).rotationEffect(.degrees(-30 + 30 * sin(t * 60)))
                        Ellipse().fill(.white.opacity(0.7)).frame(width: 6, height: 4).rotationEffect(.degrees(30 - 30 * sin(t * 60)))
                    }
                    .offset(y: -4)
                    Capsule().fill(.yellow).frame(width: 9, height: 7)
                }
                .offset(x: bee.x, y: bee.y)
            }
        }
    }

    private func beePosition(_ t: Double) -> CGPoint {
        CGPoint(x: sin(t * 0.9) * 90, y: sin(t * 1.8) * 16 - 4)
    }

    private func bloomAmount(at x: Double, time t: Double) -> Double {
        (0..<8).map { k in
            Motion.bell((x - beePosition(t - Double(k) * 0.12).x) / 14) * (1 - Double(k) / 8)
        }.max() ?? 0
    }
}

#Preview {
    Pollinating()
}
