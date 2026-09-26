//
//  Infusing.swift
//  AgenThinking
//  Meaning: Letting one thing soak its character into another.
//  Use case: When an agent injects context, style, or knowledge into its output.
//  Motion: A drop falls into the middle of the word and its color slowly diffuses outward letter by letter, like tea steeping.
//

import SwiftUI

struct Infusing: View {
    private let water = Color(red: 0.85, green: 0.93, blue: 1)
    private let tea = Color(red: 0.9, green: 0.55, blue: 0.2)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4.5)
            let drop = Motion.ramp(beat, 0, 0.1)
            let spread = Motion.window(beat, 0.1, 0.75, 0.88, 1)
            ZStack {
                Image(systemName: "drop.fill")
                    .font(.system(size: 10))
                    .foregroundStyle(tea)
                    .offset(y: -40 + 30 * drop)
                    .opacity(drop < 1 ? 1 : 0)

                Glyphs("Infusing", time: t, spacing: 1) { g in
                    let tint = Motion.ramp(spread * 1.3 - abs(g.centered), -0.1, 0.25)
                    g.text
                        .foregroundStyle(water.mix(tea, tint))
                        .offset(y: tint > 0 && tint < 1 ? sin(t * 6 + g.i) * 1 : 0)
                }
            }
        }
    }
}

#Preview {
    Infusing()
}
