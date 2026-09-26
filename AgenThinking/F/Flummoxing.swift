//
//  Flummoxing.swift
//  AgenThinking
//  Meaning: Completely baffled; stumped.
//  Use case: When an agent hits an error it can't explain yet.
//  Motion: The word does a sharp, decaying head-shake while a ?! pops up, then freezes in stunned silence.
//

import SwiftUI

struct Flummoxing: View {
    private let period = 2.8

    var body: some View {
        Clock { t in
            let since = Motion.phase(t, period) * period
            let pop = Motion.window(since, 0, 0.15, 1.6, 2)
            HStack(spacing: 6) {
                Glyphs("Flummoxing", time: t) { g in
                    let s = max(0, since - g.i * 0.012)
                    let shake = exp(-s * 3.5) * sin(s * 42)
                    g.text
                        .foregroundStyle(Color.white.mix(.orange, exp(-s * 2)))
                        .offset(x: 6 * shake)
                        .rotationEffect(.degrees(4 * shake))
                }
                .rotation3DEffect(.degrees(exp(-since * 3.5) * sin(since * 42) * 16), axis: (x: 0, y: 1, z: 0))

                Image(systemName: "exclamationmark.questionmark")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.orange)
                    .scaleEffect(pop)
                    .offset(y: -10 * pop)
            }
        }
    }
}

#Preview {
    Flummoxing()
}
