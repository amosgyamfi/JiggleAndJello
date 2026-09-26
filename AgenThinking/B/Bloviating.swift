//
//  Bloviating.swift
//  AgenThinking
//  Meaning: Talking at great length, puffed up with self-importance.
//  Use case: When an agent is producing a long, verbose response.
//  Motion: Letters inflate from the middle outward, reddening like a puffed chest, then deflate with a wobble.
//

import SwiftUI

struct Bloviating: View {
    private let period = 3.2

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let inflate = beat < 0.75
                ? Motion.smooth(beat / 0.75)
                : Motion.spring((beat - 0.75) / 0.25, bounces: 2) * 0.35
            HStack(spacing: 6) {
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.orange)
                    .scaleEffect(0.8 + 0.5 * inflate)
                Glyphs("Bloviating", time: t) { g in
                    let puff = inflate * (1 - 0.6 * abs(g.centered))
                    g.text
                        .foregroundStyle(Color.orange.mix(.red, puff))
                        .scaleEffect(1 + 0.45 * puff)
                        .fontWeight(puff > 0.4 ? .heavy : .semibold)
                }
            }
        }
    }
}

#Preview {
    Bloviating()
}
