//
//  Schlepping.swift
//  AgenThinking
//  Meaning: Hauling something heavy with great effort.
//  Use case: When an agent moves large files, big uploads, or heavy migrations.
//  Motion: Letters lean back straining, the word lurches forward one heavy step at a time, trailing letters dragged behind.
//

import SwiftUI

struct Schlepping: View {
    private let step = 1.0
    private let steps = 4

    var body: some View {
        Clock { t in
            let cycle = step * Double(steps + 1)
            let beat = Motion.phase(t, cycle) * cycle
            let completed = min(floor(beat / step), Double(steps))
            let lurch = beat < Double(steps) * step ? Motion.smooth(Motion.phase(beat, step) / 0.6) : 0
            let distance = (completed + lurch) * 12
            let reset = Motion.ramp(beat, Double(steps) * step, cycle)
            HStack(spacing: 4) {
                Glyphs("Schlepping", time: t) { g in
                    let drag = Motion.smooth(Motion.phase(beat - g.progress * 0.25, step) / 0.6)
                    let strain = sin(drag * .pi)
                    g.text
                        .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.6))
                        .rotationEffect(.degrees(-10 - 6 * strain), anchor: .bottom)
                        .offset(x: -g.progress * 6 * (1 - drag), y: 2 * g.progress)
                }
                Image(systemName: "shippingbox.fill")
                    .foregroundStyle(Color(red: 0.7, green: 0.5, blue: 0.3))
                    .offset(y: 3)
            }
            .offset(x: -30 + distance * (1 - reset))
            .opacity(1 - Motion.window(reset, 0, 0.3, 0.7, 1))
        }
    }
}

#Preview {
    Schlepping()
}
