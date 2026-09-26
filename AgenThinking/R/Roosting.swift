//
//  Roosting.swift
//  AgenThinking
//  Meaning: Settling in to rest on a perch.
//  Use case: When an agent's work is done and it settles into an idle or waiting state.
//  Motion: Letters swoop in from the sky one by one, land on a branch with a wing-flutter bounce, doze, then fly off.
//

import SwiftUI

struct Roosting: View {
    private let period = 5.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let flyOff = Motion.ramp(beat, 0.88, 1)
            VStack(spacing: 0) {
                Glyphs("Roosting", time: t, spacing: 1) { g in
                    let arrive = 0.05 + g.progress * 0.4
                    let flight = Motion.ramp(beat, arrive, arrive + 0.14)
                    let landed = beat > arrive + 0.14
                    let flutter = landed ? Motion.spring(Motion.ramp(beat, arrive + 0.14, arrive + 0.34)) : 0
                    let doze = landed ? sin(t * 1.5 + g.i) * 0.8 : 0
                    g.text
                        .foregroundStyle(Color(red: 0.95, green: 0.85, blue: 0.7))
                        .scaleEffect(x: 1 + 0.25 * flutter, y: 1 - 0.2 * flutter, anchor: .bottom)
                        .offset(
                            x: (1 - flight) * (g.random() - 0.3) * 80 + flyOff * 60,
                            y: (1 - flight) * -50 + doze - flyOff * 50
                        )
                        .opacity(flight * (1 - flyOff))
                }
                Capsule()
                    .fill(Color(red: 0.45, green: 0.3, blue: 0.18))
                    .frame(width: 150, height: 3)
                    .rotationEffect(.degrees(-2))
            }
        }
    }
}

#Preview {
    Roosting()
}
