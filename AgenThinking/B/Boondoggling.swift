//
//  Boondoggling.swift
//  AgenThinking
//  Meaning: Busy work that looks productive but goes nowhere.
//  Use case: When an agent is retrying or looping and should be nudged to change approach.
//  Motion: The word runs forward on a treadmill, then slides back to the start, while a loop arrow spins.
//

import SwiftUI

struct Boondoggling: View {
    private let period = 2.2

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let forward = beat < 0.7 ? Motion.smooth(beat / 0.7) : 1 - Motion.smooth((beat - 0.7) / 0.3)
            HStack(spacing: 8) {
                Glyphs("Boondoggling", time: t) { g in
                    let stride = abs(sin((t * 5 - g.i * 0.5) * .pi))
                    g.text
                        .foregroundStyle(Color(white: 0.65).mix(.orange, 0.3 * stride))
                        .offset(y: -4 * stride * (beat < 0.7 ? 1 : 0))
                        .rotationEffect(.degrees(beat < 0.7 ? 6 : -8))
                }
                .offset(x: -12 + 24 * forward)

                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)
                    .rotationEffect(.degrees(t * 240))
            }
        }
    }
}

#Preview {
    Boondoggling()
}
