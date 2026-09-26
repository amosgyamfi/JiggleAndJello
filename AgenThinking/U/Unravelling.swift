//
//  Unravelling.swift
//  AgenThinking
//  Meaning: Coming apart thread by thread; also, solving a tangled mystery.
//  Use case: When an agent untangles a complex bug or a knotted dependency graph.
//  Motion: Starting from the end, letters come loose one by one and dangle and sway on a hanging yarn thread, then get knitted back into place.
//

import SwiftUI

struct Unravelling: View {
    private let yarn = Color(red: 0.95, green: 0.55, blue: 0.7)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 4.4)
            Glyphs("Unravelling", time: t) { g in
                let fromEnd = 1 - g.progress
                let loose = Motion.window(beat, 0.05 + fromEnd * 0.35, 0.15 + fromEnd * 0.35, 0.78 + g.progress * 0.12, 0.84 + g.progress * 0.12)
                let drop = Motion.smooth(loose) * (8 + 14 * g.progress)
                let sway = sin(t * 2.4 + g.i * 0.6) * 7 * loose
                g.text
                    .foregroundStyle(Color.white.mix(yarn, loose))
                    .overlay(alignment: .top) {
                        Rectangle()
                            .fill(yarn.opacity(0.8))
                            .frame(width: 1, height: drop)
                            .offset(y: -drop)
                    }
                    .offset(y: drop)
                    .rotationEffect(.degrees(sway), anchor: UnitPoint(x: 0.5, y: -drop / 28))
            }
            .offset(y: -8)
        }
    }
}

#Preview {
    Unravelling()
}
