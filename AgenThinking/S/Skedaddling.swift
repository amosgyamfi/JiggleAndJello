//
//  Skedaddling.swift
//  AgenThinking
//  Meaning: Running off in a hurry.
//  Use case: When an agent quickly exits, cancels, or hands off.
//  Motion: Letters bolt off stage right one after another, stretching with speed, then sneak back in from the left.
//

import SwiftUI

struct Skedaddling: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3)
            Glyphs("Skedaddling", time: t) { g in
                let leave = pow(Motion.ramp(beat, 0.1 + (1 - g.progress) * 0.25, 0.25 + (1 - g.progress) * 0.25), 2)
                let back = Motion.ramp(beat, 0.6 + g.progress * 0.15, 0.8 + g.progress * 0.15)
                let speed = sin(leave * .pi)
                g.text
                    .foregroundStyle(Color.white.mix(.cyan, speed))
                    .scaleEffect(x: 1 + 0.8 * speed, y: 1 - 0.2 * speed, anchor: .leading)
                    .offset(x: leave < 1 ? leave * 220 : (1 - back) * -220)
                    .opacity(leave < 1 ? 1 - leave * 0.5 : back)
            }
            .frame(width: 280)
            .clipped()
        }
    }
}

#Preview {
    Skedaddling()
}
