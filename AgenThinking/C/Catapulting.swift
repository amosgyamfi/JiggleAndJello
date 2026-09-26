//
//  Catapulting.swift
//  AgenThinking
//  Meaning: Launching something forward with sudden force.
//  Use case: When an agent kicks off a deploy, release, or big batch job.
//  Motion: Each letter crouches, flips through the air on a high arc, and lands with a squash, one after another.
//

import SwiftUI

struct Catapulting: View {
    var body: some View {
        Clock { t in
            Glyphs("Catapulting", time: t) { g in
                let local = g.phase(3, lag: -0.16)
                let crouch = Motion.window(local, 0, 0.05, 0.07, 0.09)
                let flight = Motion.ramp(local, 0.08, 0.3)
                let inAir = flight > 0 && flight < 1
                let land = Motion.window(local, 0.3, 0.32, 0.34, 0.42)
                g.text
                    .foregroundStyle(inAir ? Color.orange : .white)
                    .scaleEffect(x: 1 + 0.2 * (crouch + land), y: 1 - 0.3 * (crouch + land), anchor: .bottom)
                    .rotationEffect(.degrees(flight * 360))
                    .offset(x: sin(flight * .pi) * 4, y: -40 * Motion.hop(flight))
            }
        }
    }
}

#Preview {
    Catapulting()
}
