//
//  Clauding.swift
//  AgenThinking
//  Meaning: Thinking the way Claude does.
//  Use case: The default "working on it" state for a Claude-powered agent.
//  Motion: Claude Code's spinner glyph (· ✢ ✳ ✶ ✻ ✽) breathes back and forth while a warm shimmer sweeps through terracotta letters.
//

import SwiftUI

struct Clauding: View {
    private let frames = ["·", "✢", "✳", "✶", "✻", "✽"]
    private let highlight = Color(red: 1, green: 0.84, blue: 0.74)

    var body: some View {
        Clock { t in
            let step = Int(t / 0.12) % (frames.count * 2 - 2)
            let frame = step < frames.count ? step : frames.count * 2 - 2 - step
            HStack(spacing: 8) {
                Text(frames[frame])
                    .foregroundStyle(Agent.claude)
                    .frame(width: 22)
                    .rotationEffect(.degrees(t * 30))
                Glyphs("Clauding…", time: t) { g in
                    g.text.foregroundStyle(Agent.claude.mix(highlight, g.sweep(2.2, width: 0.16)))
                }
            }
        }
    }
}

#Preview {
    Clauding()
}
