//
//  Flowing.swift
//  AgenThinking
//  Meaning: Moving smoothly and effortlessly, in the zone.
//  Use case: When an agent streams a long answer without hesitation.
//  Motion: A seamless looping gradient streams through the whole word as the letters ride a gentle current.
//

import SwiftUI

struct Flowing: View {
    private let colors: [Color] = [.cyan, .blue, .purple, .cyan, .blue, .purple, .cyan]

    var body: some View {
        Clock { t in
            let shift = Motion.phase(t, 2.5)
            Glyphs("Flowing", time: t, spacing: 1) { g in
                g.text
                    .offset(y: g.wave(0.7, lag: 0.12) * 4)
                    .rotationEffect(.degrees(g.wave(0.7, lag: 0.12 + 0.25) * 6))
            }
            .paint(LinearGradient(
                colors: colors,
                startPoint: UnitPoint(x: -shift, y: 0.5),
                endPoint: UnitPoint(x: 2 - shift, y: 0.5)
            ))
        }
    }
}

#Preview {
    Flowing()
}
