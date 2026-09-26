//
//  Working.swift
//  AgenThinking
//  Meaning: Doing steady, productive labor.
//  Use case: The plain "Working…" state for a busy agent.
//  Motion: Letters stamp down in a steady, rhythmic piston sequence, each firing in turn, while a gear turns steadily alongside.
//

import SwiftUI

struct Working: View {
    var body: some View {
        Clock { t in
            HStack(spacing: 8) {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(Color(red: 1, green: 0.7, blue: 0.3))
                    .rotationEffect(.degrees(t * 90))
                Glyphs("Working", time: t, spacing: 1) { g in
                    let stroke = Motion.bell((g.phase(1.4, lag: 0.12) - 0.1) / 0.06)
                    g.text
                        .foregroundStyle(Color.white.mix(Color(red: 1, green: 0.7, blue: 0.3), stroke))
                        .scaleEffect(x: 1 + 0.15 * stroke, y: 1 - 0.2 * stroke, anchor: .bottom)
                        .offset(y: 3 * stroke)
                }
            }
        }
    }
}

#Preview {
    Working()
}
