//
//  Swooping.swift
//  AgenThinking
//  Meaning: Diving down swiftly and gracefully.
//  Use case: When an agent zooms in on a specific detail, then pulls back out.
//  Motion: A bird dives through the word in a U-shaped arc; each letter dips and tilts in its wake as it swoops past.
//

import SwiftUI

struct Swooping: View {
    private let period = 2.6
    private let span = 170.0

    var body: some View {
        Clock { t in
            let flight = Motion.phase(t, period) * 1.4 - 0.2
            ZStack {
                Glyphs("Swooping", time: t, spacing: 1) { g in
                    let wake = Motion.ramp(flight - g.progress, -0.1, 0.1) * (1 - Motion.ramp(flight - g.progress, 0.1, 0.4))
                    g.text
                        .foregroundStyle(Color.white.mix(.cyan, wake))
                        .offset(y: 12 * wake)
                        .rotationEffect(.degrees(-15 * wake))
                }
                Image(systemName: "bird.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(.cyan)
                    .rotationEffect(.degrees(cos(flight * .pi) * -35))
                    .offset(x: (flight - 0.5) * span, y: -34 + 36 * sin(min(max(flight, 0), 1) * .pi))
            }
        }
    }
}

#Preview {
    Swooping()
}
