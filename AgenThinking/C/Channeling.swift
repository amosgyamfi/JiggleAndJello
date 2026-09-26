//
//  Channeling.swift
//  AgenThinking
//  Meaning: Directing energy through a single path.
//  Use case: When an agent routes a request through a specific tool or pipeline.
//  Motion: Pulses of violet energy travel along a conduit and through the letters, lifting and lighting each as they pass.
//

import SwiftUI

struct Channeling: View {
    var body: some View {
        Clock { t in
            VStack(spacing: 6) {
                Glyphs("Channeling", time: t) { g in
                    let surge = max(g.sweep(1.6, width: 0.14), g.sweep(1.6, width: 0.14, offset: 0.5))
                    g.text
                        .foregroundStyle(Color.purple.mix(.white, surge))
                        .offset(y: -7 * surge)
                        .scaleEffect(1 + 0.1 * surge)
                        .shadow(color: .purple, radius: 10 * surge)
                }
                Capsule()
                    .fill(.purple.opacity(0.35))
                    .frame(width: 170, height: 3)
                    .shimmer(t, period: 0.8, color: .white, width: 0.15)
            }
        }
    }
}

#Preview {
    Channeling()
}
