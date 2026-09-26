//
//  Ideating.swift
//  AgenThinking
//  Meaning: Coming up with ideas.
//  Use case: When an agent brainstorms options or proposes approaches.
//  Motion: A lightbulb flickers on, light flows into the letters from the bulb outward, and random letters spark with fresh ideas.
//

import SwiftUI

struct Ideating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            let flicker = beat < 0.18 ? (Motion.random(Int(t * 20)) > 0.5 ? 1.0 : 0.15) : 1.0
            let lit = Motion.window(beat, 0.1, 0.18, 0.88, 1) * flicker
            HStack(spacing: 8) {
                Image(systemName: lit > 0.5 ? "lightbulb.max.fill" : "lightbulb")
                    .foregroundStyle(Color.gray.mix(.yellow, lit))
                    .glow(.yellow.opacity(lit), radius: 12 * lit)

                Glyphs("Ideating", time: t, spacing: 1) { g in
                    let reached = Motion.ramp(beat, 0.2 + g.progress * 0.3, 0.3 + g.progress * 0.3) * lit
                    let spark = max(0, g.noise(3, salt: 5) - 0.55) / 0.45 * reached
                    g.text
                        .foregroundStyle(Color(white: 0.4).mix(Color(red: 1, green: 0.95, blue: 0.7), reached).mix(.yellow, spark))
                        .scaleEffect(1 + 0.2 * spark)
                        .shadow(color: .yellow.opacity(spark), radius: 8 * spark)
                }
            }
        }
    }
}

#Preview {
    Ideating()
}
