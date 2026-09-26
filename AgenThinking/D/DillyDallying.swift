//
//  DillyDallying.swift
//  AgenThinking
//  Meaning: Wasting time; dawdling instead of getting on with it.
//  Use case: When an agent is waiting on a slow dependency with nothing else to do.
//  Motion: The word drifts lazily side to side, trailing letters lag behind the leader and gaze around.
//

import SwiftUI

struct DillyDallying: View {
    var body: some View {
        Clock { t in
            Glyphs("Dilly-dallying", time: t) { g in
                let lagged = t - g.i * 0.22
                let drift = sin(lagged * 0.55) * 16 - sin(t * 0.55) * 16
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.93, blue: 0.6).mix(.gray, 0.3 * g.progress))
                    .offset(x: drift, y: sin(lagged * 0.9) * 2.5)
                    .rotationEffect(.degrees(g.noise(0.35) * 12))
            }
            .offset(x: sin(t * 0.55) * 16)
        }
    }
}

#Preview {
    DillyDallying()
}
