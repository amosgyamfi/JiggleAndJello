//
//  Propagating.swift
//  AgenThinking
//  Meaning: Spreading a signal or change outward through a system.
//  Use case: When an agent pushes a change that ripples through dependents.
//  Motion: A pulse leaves a transmitter, travels across the letters, reflects off the end, and echoes back weaker each time.
//

import SwiftUI

struct Propagating: View {
    private let legDuration = 1.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, legDuration * 3) * 3
            let leg = min(Int(beat), 2)
            let within = beat - Double(leg)
            let front = leg == 1 ? 1 - within : within
            let strength = [1.0, 0.6, 0.35][leg]
            HStack(spacing: 8) {
                Image(systemName: "dot.radiowaves.right")
                    .foregroundStyle(.mint)
                    .opacity(leg == 0 && within < 0.3 ? 1 : 0.5)
                Glyphs("Propagating", time: t) { g in
                    let pulse = Motion.bell((g.progress - front) / 0.12) * strength
                    g.text
                        .foregroundStyle(Color(white: 0.6).mix(.mint, pulse))
                        .offset(y: -12 * pulse)
                        .scaleEffect(1 + 0.15 * pulse)
                }
            }
        }
    }
}

#Preview {
    Propagating()
}
