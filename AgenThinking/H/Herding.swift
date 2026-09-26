//
//  Herding.swift
//  AgenThinking
//  Meaning: Gathering scattered things and guiding them together.
//  Use case: When an agent collects scattered files, tasks, or sub-agents into order.
//  Motion: Letters wander off like sheep until a pawprint sweeps along the row, nudging each back into line.
//

import SwiftUI

struct Herding: View {
    private let period = 4.0
    private let span = 220.0

    var body: some View {
        Clock { t in
            let dog = Motion.ramp(Motion.phase(t, period), 0.35, 0.85) * 1.2 - 0.1
            ZStack {
                Glyphs("Herding", time: t, spacing: 2) { g in
                    let gathered = Motion.ramp(dog - g.progress, -0.05, 0.1) * (1 - Motion.ramp(Motion.phase(t, period), 0.95, 1))
                    let stray = 1 - gathered
                    g.text
                        .foregroundStyle(Color.white.mix(.gray, 0.4 * stray))
                        .offset(x: stray * g.noise(0.4) * 14, y: stray * g.noise(0.35, salt: 1) * 20)
                        .rotationEffect(.degrees(stray * g.noise(0.5, salt: 2) * 20))
                }
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.orange)
                    .offset(x: (dog - 0.5) * span * 0.6, y: 22 + abs(sin(t * 10)) * -3)
                    .opacity(dog > -0.05 && dog < 1.05 ? 1 : 0)
            }
        }
    }
}

#Preview {
    Herding()
}
