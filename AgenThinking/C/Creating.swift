//
//  Creating.swift
//  AgenThinking
//  Meaning: Bringing something new into existence.
//  Use case: When an agent creates new files, assets, or content from scratch.
//  Motion: Letters spark into being from the center outward with little starbursts, painted in a rainbow gradient.
//

import SwiftUI

struct Creating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.4)
            Glyphs("Creating", time: t, spacing: 1) { g in
                let start = abs(g.centered) * 0.3
                let born = Motion.ramp(beat, start, start + 0.12)
                let pop = born > 0 && born < 1 ? 0 : Motion.spring(Motion.ramp(beat, start + 0.12, start + 0.4))
                let spark = Motion.window(beat, start, start + 0.05, start + 0.1, start + 0.25)
                g.text
                    .scaleEffect(born * (1 + 0.25 * pop))
                    .rotationEffect(.degrees((1 - born) * -120))
                    .overlay {
                        Image(systemName: "sparkle")
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                            .scaleEffect(0.4 + spark)
                            .rotationEffect(.degrees(spark * 90))
                            .opacity(spark)
                    }
            }
            .paint(LinearGradient(colors: [.red, .orange, .yellow, .green, .cyan, .purple], startPoint: .leading, endPoint: .trailing))
            .opacity(1 - Motion.ramp(beat, 0.88, 1))
        }
    }
}

#Preview {
    Creating()
}
