//
//  Honking.swift
//  AgenThinking
//  Meaning: A loud, attention-grabbing signal.
//  Use case: When an agent raises an alert or needs the user's attention.
//  Motion: A double honk: the word blasts outward twice with stretching letters and sound waves, then pauses.
//

import SwiftUI

struct Honking: View {
    var body: some View {
        Clock { t in
            let since = Motion.phase(t, 2) * 2
            let honk = max(exp(-since * 9), since > 0.32 ? exp(-(since - 0.32) * 9) : 0)
            HStack(spacing: 6) {
                Glyphs("Honking", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(Color.yellow.mix(.orange, honk))
                        .scaleEffect(x: 1 + 0.1 * honk, y: 1 + 0.35 * honk * (1 - 0.5 * abs(g.centered)))
                }
                .scaleEffect(1 + 0.12 * honk)

                Image(systemName: "wave.3.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.orange)
                    .scaleEffect(0.7 + 0.6 * honk, anchor: .leading)
                    .opacity(0.2 + 0.8 * honk)
            }
        }
    }
}

#Preview {
    Honking()
}
