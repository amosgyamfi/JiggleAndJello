//
//  Germinating.swift
//  AgenThinking
//  Meaning: A seed of an idea starting to sprout.
//  Use case: The very first moments of an agent's plan forming.
//  Motion: Seeds sit in the soil, split open at random moments, and letters push up from them, greening as they grow.
//

import SwiftUI

struct Germinating: View {
    private let seed = Color(red: 0.6, green: 0.42, blue: 0.25)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4.2)
            VStack(spacing: 0) {
                Glyphs("Germinating", time: t) { g in
                    let crack = 0.05 + g.random() * 0.4
                    let split = Motion.ramp(beat, crack, crack + 0.06)
                    let grow = Motion.window(beat, crack + 0.05, crack + 0.25, 0.9, 1)
                    g.text
                        .foregroundStyle(seed.mix(.green, grow))
                        .scaleEffect(x: 0.6 + 0.4 * grow, y: grow, anchor: .bottom)
                        .overlay(alignment: .bottom) {
                            HStack(spacing: 2 * split) {
                                Ellipse().fill(seed).frame(width: 3.5, height: 6)
                                Ellipse().fill(seed).frame(width: 3.5, height: 6)
                            }
                            .rotationEffect(.degrees(90 * (1 - split)))
                            .opacity(1 - grow)
                            .offset(y: 4)
                        }
                }
                Capsule()
                    .fill(Color(red: 0.4, green: 0.28, blue: 0.18))
                    .frame(width: 180, height: 3)
            }
        }
    }
}

#Preview {
    Germinating()
}
