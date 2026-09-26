//
//  Mustering.swift
//  AgenThinking
//  Meaning: Gathering forces or resources, ready for action.
//  Use case: When an agent collects tools, credentials, and context before a big task.
//  Motion: Two squads of letters march in step from opposite sides, meet in formation, and snap to attention.
//

import SwiftUI

struct Mustering: View {
    private let steps = 8.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            let march = Motion.ramp(beat, 0.05, 0.55) * steps
            let stepIndex = floor(march)
            let within = march - stepIndex
            let gathered = (stepIndex + Motion.smooth(within)) / steps
            let attention = beat > 0.58 ? Motion.spring(Motion.ramp(beat, 0.58, 0.8)) : 0
            let dismiss = Motion.ramp(beat, 0.9, 1)
            Glyphs("Mustering", time: t, spacing: 1) { g in
                let side: Double = g.centered < 0 ? -1 : 1
                let marching = gathered < 1
                g.text
                    .foregroundStyle(marching ? Color(red: 0.6, green: 0.75, blue: 0.5) : Color(red: 0.8, green: 1, blue: 0.7))
                    .offset(x: side * 90 * (1 - gathered), y: marching ? -3 * sin(within * .pi) : -3 * attention)
                    .scaleEffect(1 + 0.1 * attention)
            }
            .opacity(1 - dismiss)
        }
    }
}

#Preview {
    Mustering()
}
