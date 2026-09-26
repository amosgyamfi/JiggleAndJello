//
//  Transmuting.swift
//  AgenThinking
//  Meaning: Changing one substance into another; alchemy turning lead into gold.
//  Use case: When an agent converts data from one format into another.
//  Motion: Dull lead-gray letters turn to gold from left to right while an alchemical symbol spins and a gleam runs across the gold.
//

import SwiftUI

struct Transmuting: View {
    private let lead = Color(white: 0.42)
    private let gold = Color(red: 1, green: 0.8, blue: 0.3)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            HStack(spacing: 8) {
                Image(systemName: "triangle.circle")
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(lead.mix(gold, Motion.window(beat, 0.05, 0.5, 0.85, 1)))
                    .rotationEffect(.degrees(t * 120))

                Glyphs("Transmuting", time: t) { g in
                    let turned = Motion.window(beat, 0.08 + g.progress * 0.4, 0.14 + g.progress * 0.4, 0.86, 0.98)
                    let spark = Motion.bell((beat - 0.11 - g.progress * 0.4) / 0.03)
                    g.text
                        .foregroundStyle(lead.mix(gold, turned).mix(.white, spark))
                        .scaleEffect(1 + 0.2 * spark)
                        .shadow(color: .yellow.opacity(0.5 * turned), radius: 4)
                }
                .shimmer(t, period: 2, color: .white, width: 0.12)
            }
        }
    }
}

#Preview {
    Transmuting()
}
