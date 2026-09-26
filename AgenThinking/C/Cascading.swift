//
//  Cascading.swift
//  AgenThinking
//  Meaning: One step flowing into the next, like a waterfall.
//  Use case: When an agent's change triggers a chain of follow-up updates.
//  Motion: Letters pour down from above in a staggered stream, hold, then spill away below.
//

import SwiftUI

struct Cascading: View {
    var body: some View {
        Clock { t in
            Glyphs("Cascading", time: t) { g in
                let local = g.phase(3, lag: 0.05)
                let enter = Motion.ramp(local, 0, 0.16)
                let exit = Motion.ramp(local, 0.84, 1)
                let moving = sin(enter * .pi) + sin(exit * .pi)
                g.text
                    .foregroundStyle(Color.blue.mix(.cyan, g.progress).mix(.white, 0.5 * moving))
                    .scaleEffect(x: 1 - 0.15 * moving, y: 1 + 0.35 * moving)
                    .offset(y: (1 - enter) * -32 + exit * 32)
                    .opacity(enter * (1 - exit))
            }
        }
    }
}

#Preview {
    Cascading()
}
