//
//  Calculating.swift
//  AgenThinking
//  Meaning: Working out numbers precisely.
//  Use case: When an agent runs math, estimates costs, or aggregates metrics.
//  Motion: Each letter slot rolls through digits like an odometer, then clicks into the right letter, left to right.
//

import SwiftUI

struct Calculating: View {
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period) * period
            Glyphs("Calculating", time: t) { g in
                let settle = 0.3 + g.progress * 1.6
                let rolling = beat < settle
                let roll = Motion.phase(t * 16, 1)
                let digit = String((Int(t * 16) + g.index * 3) % 10)
                let land = rolling ? 0 : Motion.spring((beat - settle) / 0.6)
                Text(rolling ? digit : g.character)
                    .foregroundStyle(rolling ? Color.cyan.opacity(0.55) : .white)
                    .offset(y: rolling ? (roll - 0.5) * 18 : -5 * land)
                    .frame(width: 15, height: 30)
                    .clipped()
            }
            .fontDesign(.monospaced)
        }
    }
}

#Preview {
    Calculating()
}
