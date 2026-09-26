//
//  Vibing.swift
//  AgenThinking
//  Meaning: Relaxing and enjoying the atmosphere or mood.
//  Use case: A laid-back "vibe coding" state.
//  Motion: Letters bob lazily to a slow groove with a drifting sunset hue while little equalizer bars pulse to the beat.
//

import SwiftUI

struct Vibing: View {
    var body: some View {
        Clock { t in
            HStack(spacing: 10) {
                HStack(alignment: .bottom, spacing: 2) {
                    ForEach(0..<5, id: \.self) { k in
                        let level = 0.3 + 0.7 * abs(sin(t * (2.2 + Double(k) * 0.37) + Double(k)))
                        Capsule()
                            .fill(Color(hue: Motion.phase(t * 0.08 + Double(k) * 0.05, 1), saturation: 0.6, brightness: 1))
                            .frame(width: 3, height: 20 * level)
                    }
                }
                .frame(height: 20, alignment: .bottom)

                Glyphs("Vibing", time: t, spacing: 1) { g in
                    g.text
                        .offset(y: g.wave(0.5, lag: 0.12) * 4)
                        .rotationEffect(.degrees(g.wave(0.5, lag: 0.12 + 0.25) * 6))
                }
                .paint(LinearGradient(colors: [.pink, .orange, .purple], startPoint: .leading, endPoint: .trailing))
                .hueRotation(.degrees(t * 30))
            }
        }
    }
}

#Preview {
    Vibing()
}
