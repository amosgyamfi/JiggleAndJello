//
//  Effecting.swift
//  AgenThinking
//  Meaning: Bringing about a change.
//  Use case: When an agent applies edits or side-effects to a system.
//  Motion: A ripple ring spreads from the center; each letter it touches bumps up and flips to a new color.
//

import SwiftUI

struct Effecting: View {
    private let period = 2.2

    var body: some View {
        Clock { t in
            let ring = Motion.phase(t, period)
            let round = Int(t / period)
            let before = round.isMultiple(of: 2) ? Color.teal : Color(red: 1, green: 0.5, blue: 0.45)
            let after = round.isMultiple(of: 2) ? Color(red: 1, green: 0.5, blue: 0.45) : Color.teal
            ZStack {
                Ellipse()
                    .stroke(after.opacity(1 - ring), lineWidth: 2)
                    .frame(width: 220 * ring, height: 60 * ring)

                Glyphs("Effecting", time: t) { g in
                    let reached = abs(g.centered) < ring
                    let hit = Motion.bell((abs(g.centered) - ring) / 0.15)
                    g.text
                        .foregroundStyle(reached ? after : before)
                        .scaleEffect(1 + 0.25 * hit)
                        .offset(y: -5 * hit)
                }
            }
        }
    }
}

#Preview {
    Effecting()
}
