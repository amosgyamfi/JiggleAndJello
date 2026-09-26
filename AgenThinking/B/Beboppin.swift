//
//  Beboppin.swift
//  AgenThinking
//  Meaning: Moving along with a quick, jazzy, improvised rhythm.
//  Use case: When an agent is happily working through light, fast tasks.
//  Motion: Even letters hit the beat and odd letters the swung off-beat, tilting as music notes drift up.
//

import SwiftUI

struct Beboppin: View {
    private let beat = 0.66

    var body: some View {
        Clock { t in
            ZStack {
                Glyphs("Beboppin'", time: t) { g in
                    let local = Motion.phase(t + (g.isEven ? 0 : beat * 0.62), beat)
                    let bop = Motion.hop(min(local / 0.45, 1))
                    g.text
                        .foregroundStyle(Color.purple.mix(.pink, g.progress))
                        .offset(y: -10 * bop)
                        .rotationEffect(.degrees((g.isEven ? -9 : 9) * bop))
                        .scaleEffect(1 + 0.08 * bop)
                }

                Particles(4, time: t, period: 2.4) { k, life in
                    Text(k.isMultiple(of: 2) ? "♪" : "♫")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.pink)
                        .rotationEffect(.degrees(sin(life * 7) * 18))
                        .offset(x: 70 + Double(k) * 9, y: 6 - life * 42)
                        .opacity(Motion.window(life, 0, 0.2, 0.6, 1))
                }
            }
        }
    }
}

#Preview {
    Beboppin()
}
