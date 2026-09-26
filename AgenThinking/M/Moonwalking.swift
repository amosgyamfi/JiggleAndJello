//
//  Moonwalking.swift
//  AgenThinking
//  Meaning: Appearing to move forward while actually gliding backward.
//  Use case: When an agent reverts changes or rolls back smoothly.
//  Motion: Letters step forward heel-toe, yet the whole word glides smoothly backward under a crescent moon.
//

import SwiftUI

struct Moonwalking: View {
    private let period = 5.0

    var body: some View {
        Clock { t in
            let glide = Motion.phase(t, period)
            HStack(spacing: 8) {
                Image(systemName: "moon.stars.fill")
                    .foregroundStyle(Color(red: 0.95, green: 0.9, blue: 0.6))
                Glyphs("Moonwalking", time: t) { g in
                    let heel = max(0, sin(t * 3 * .pi + (g.isEven ? 0 : .pi)))
                    g.text
                        .foregroundStyle(Agent.kimi.mix(.white, 0.45 + 0.55 * heel))
                        .rotationEffect(.degrees(-12 * heel), anchor: .bottomTrailing)
                        .offset(y: -3 * heel)
                }
            }
            .offset(x: 50 - glide * 100)
            .opacity(Motion.window(glide, 0, 0.12, 0.88, 1))
        }
    }
}

#Preview {
    Moonwalking()
}
