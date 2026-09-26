//
//  Thinking.swift
//  AgenThinking
//  Meaning: Using the mind to reason about something.
//  Use case: The default AI "Thinking…" state.
//  Motion: A Gemini-style four-point sparkle turns and breathes beside the word while a blue-violet-rose gradient shimmer sweeps through it.
//

import SwiftUI

struct Thinking: View {
    var body: some View {
        Clock { t in
            let breath = (sin(t * 2.4) + 1) / 2
            HStack(spacing: 10) {
                Image(systemName: "sparkle")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: Agent.gemini, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .rotationEffect(.degrees(t * 90))
                    .scaleEffect(0.8 + 0.3 * breath)
                    .glow(Agent.gemini[1], radius: 4 + 6 * breath)

                Glyphs("Thinking", time: t) { g in
                    g.text
                        .opacity(0.55 + 0.45 * g.sweep(2, width: 0.3))
                        .offset(y: -1.5 * g.sweep(2, width: 0.3))
                }
                .paint(LinearGradient(
                    colors: Agent.gemini + Agent.gemini,
                    startPoint: UnitPoint(x: -1 + Motion.phase(t, 3), y: 0),
                    endPoint: UnitPoint(x: 1 + Motion.phase(t, 3), y: 0)
                ))
            }
        }
    }
}

#Preview {
    Thinking()
}
