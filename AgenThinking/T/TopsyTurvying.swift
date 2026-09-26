//
//  TopsyTurvying.swift
//  AgenThinking
//  Meaning: Turning things upside down; a state of confusion.
//  Use case: When an agent flips an approach or inverts a condition.
//  Motion: A wave flips each letter upside down in 3-D, holds it there, then a second wave turns everything right side up.
//

import SwiftUI

struct TopsyTurvying: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            Glyphs("Topsy-turvying", time: t) { g in
                let down = Motion.smooth(Motion.ramp(beat, 0.05 + g.progress * 0.25, 0.2 + g.progress * 0.25))
                let up = Motion.smooth(Motion.ramp(beat, 0.55 + g.progress * 0.25, 0.7 + g.progress * 0.25))
                let flip = down - up
                g.text
                    .foregroundStyle(Color(red: 0.6, green: 0.9, blue: 1).mix(Color(red: 1, green: 0.6, blue: 0.9), flip))
                    .rotation3DEffect(.degrees(180 * (down + up)), axis: (x: 1, y: 0, z: 0), perspective: 0.6)
            }
        }
    }
}

#Preview {
    TopsyTurvying()
}
