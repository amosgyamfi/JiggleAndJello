//
//  Whatchamacalliting.swift
//  AgenThinking
//  Meaning: Struggling to name a thing whose name you can't recall.
//  Use case: When an agent searches for the right name for a variable, function, or concept.
//  Motion: Random letters blank out into wobbling question marks, as if on the tip of the tongue, then pop back as the word is remembered.
//

import SwiftUI

struct Whatchamacalliting: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            let round = Int(t / 3.6)
            Glyphs("Whatchamacalliting", time: t, spacing: -0.3) { g in
                let forgetAt = 0.05 + g.random(round) * 0.35
                let recallAt = 0.6 + g.random(round + 99) * 0.25
                let forgotten = g.random(round + 7) < 0.55 && beat > forgetAt && beat < recallAt
                let pop = Motion.bell((beat - recallAt) / 0.03)
                Group {
                    if forgotten {
                        Text("?")
                            .foregroundStyle(Color(red: 1, green: 0.8, blue: 0.4))
                            .rotationEffect(.degrees(g.wave(1.4, lag: 0.3) * 18))
                    } else {
                        g.text
                            .foregroundStyle(Color.white.mix(.yellow, pop))
                            .scaleEffect(1 + 0.3 * pop)
                    }
                }
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
    }
}

#Preview {
    Whatchamacalliting()
}
