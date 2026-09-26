//
//  Shimmying.swift
//  AgenThinking
//  Meaning: A fast, shaking dance of the shoulders.
//  Use case: When an agent wiggles a stuck process loose, like retrying a flaky step.
//  Motion: Letters shake rapidly from their base like tassels while the shimmy's intensity rolls across the word.
//

import SwiftUI

struct Shimmying: View {
    var body: some View {
        Clock { t in
            Glyphs("Shimmying", time: t) { g in
                let intensity = 0.3 + 0.7 * g.pulse(0.6, lag: 0.08)
                let shake = sin(t * 2 * .pi * 9 + g.i * 0.7) * intensity
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.85, blue: 0.4).mix(.pink, intensity * 0.5))
                    .rotationEffect(.degrees(7 * shake), anchor: .bottom)
                    .offset(x: 1.5 * shake)
            }
            .shimmer(t, period: 1.2, color: .white.opacity(0.7), width: 0.15)
        }
    }
}

#Preview {
    Shimmying()
}
