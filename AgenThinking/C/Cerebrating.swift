//
//  Cerebrating.swift
//  AgenThinking
//  Meaning: Using the brain; thinking hard.
//  Use case: When an agent is reasoning through a complex problem.
//  Motion: A brain pulses while letters fire like neurons, each flaring pink and violet at its own unpredictable moment.
//

import SwiftUI

struct Cerebrating: View {
    var body: some View {
        Clock { t in
            HStack(spacing: 8) {
                Image(systemName: "brain")
                    .foregroundStyle(.pink)
                    .scaleEffect(1 + 0.08 * sin(t * 5))
                    .glow(.pink, radius: 6)

                Glyphs("Cerebrating", time: t) { g in
                    let fire = max(0, g.noise(2.4, salt: 4) - 0.35) / 0.65
                    g.text
                        .foregroundStyle(Color(hue: 0.82 + 0.08 * fire, saturation: 0.6 - 0.35 * fire, brightness: 0.65 + 0.35 * fire))
                        .scaleEffect(1 + 0.14 * fire)
                        .shadow(color: .pink.opacity(fire), radius: 8 * fire)
                }
            }
        }
    }
}

#Preview {
    Cerebrating()
}
