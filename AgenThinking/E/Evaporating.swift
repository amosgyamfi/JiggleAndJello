//
//  Evaporating.swift
//  AgenThinking
//  Meaning: Vanishing gradually into thin air.
//  Use case: When an agent cleans up temp files, clears caches, or discards a draft.
//  Motion: Letters warm up, drift upward, blur, and dissolve in random order, then condense back down.
//

import SwiftUI

struct Evaporating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4)
            Glyphs("Evaporating", time: t) { g in
                let start = g.random() * 0.35
                let vapor = Motion.window(beat, start, start + 0.3, 0.8, 0.98)
                g.text
                    .foregroundStyle(Color.blue.mix(.white, 0.5 + 0.5 * vapor))
                    .offset(x: sin(t * 3 + g.i) * 4 * vapor, y: -22 * vapor)
                    .scaleEffect(1 + 0.4 * vapor)
                    .blur(radius: 5 * vapor)
                    .opacity(1 - 0.9 * vapor)
            }
        }
    }
}

#Preview {
    Evaporating()
}
