//
//  Doing.swift
//  AgenThinking
//  Meaning: Simply getting the work done.
//  Use case: A neutral, no-frills status while an agent executes a task.
//  Motion: Letters march in place, alternating steps on the beat, above a progress bar that keeps filling.
//

import SwiftUI

struct Doing: View {
    var body: some View {
        Clock { t in
            let fill = Motion.smooth(Motion.phase(t, 2.4) / 0.85)
            VStack(spacing: 10) {
                Glyphs("Doing", time: t, spacing: 2) { g in
                    let step = abs(sin((t * 1.6 + (g.isEven ? 0 : 0.5)) * .pi))
                    g.text
                        .offset(y: -5 * step)
                        .rotationEffect(.degrees((g.isEven ? -4 : 4) * step))
                }
                ZStack(alignment: .leading) {
                    Capsule().fill(.white.opacity(0.1))
                    Capsule().fill(.white).frame(width: 90 * fill)
                }
                .frame(width: 90, height: 4)
            }
        }
    }
}

#Preview {
    Doing()
}
