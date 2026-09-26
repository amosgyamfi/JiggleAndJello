//
//  Ebbing.swift
//  AgenThinking
//  Meaning: Receding gradually, like the tide going out.
//  Use case: When an agent winds down a task, releases resources, or backs off.
//  Motion: Letters slide back and fade as the tide recedes, the far end most of all, then wash back in over a foam line.
//

import SwiftUI

struct Ebbing: View {
    var body: some View {
        Clock { t in
            let tide = (1 - cos(t * 0.9)) / 2
            VStack(spacing: 4) {
                Glyphs("Ebbing", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(Color.teal.mix(.white, 0.4 * (1 - tide)))
                        .offset(x: -12 * tide * (0.3 + 0.7 * g.progress), y: g.wave(0.5, lag: 0.1) * 1.5)
                        .opacity(1 - 0.7 * tide * g.progress)
                }
                Capsule()
                    .fill(LinearGradient(colors: [.teal.opacity(0.6), .white.opacity(0.5), .clear], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 120, height: 2)
                    .scaleEffect(x: 1 - 0.45 * tide, anchor: .leading)
            }
        }
    }
}

#Preview {
    Ebbing()
}
