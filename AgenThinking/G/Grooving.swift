//
//  Grooving.swift
//  AgenThinking
//  Meaning: Settled into a comfortable, productive rhythm.
//  Use case: When an agent is steadily working through a repeating pattern of tasks.
//  Motion: A vinyl record spins as the word sways side to side and nods on the beat, letters following the sway with a lag.
//

import SwiftUI

struct Grooving: View {
    var body: some View {
        Clock { t in
            let beat = t * 2 * .pi / 1.1
            HStack(spacing: 10) {
                Image(systemName: "record.circle")
                    .font(.system(size: 22))
                    .foregroundStyle(Color.purple.mix(.white, 0.3))
                    .rotationEffect(.degrees(t * 200))

                Glyphs("Grooving", time: t) { g in
                    let sway = sin(beat - g.i * 0.25)
                    g.text
                        .foregroundStyle(Color.orange.mix(.purple, (sway + 1) / 2))
                        .rotationEffect(.degrees(sway * 8), anchor: .bottom)
                        .offset(x: sway * 3, y: -abs(sin(beat * 2 - g.i * 0.25)) * 3)
                }
            }
        }
    }
}

#Preview {
    Grooving()
}
