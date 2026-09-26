//
//  Percolating.swift
//  AgenThinking
//  Meaning: Bubbling up gradually; ideas slowly forming.
//  Use case: When an agent's background thinking surfaces a new idea.
//  Motion: Like a coffee percolator, letters randomly burst upward and pop a bubble at the top, then drip back down.
//

import SwiftUI

struct Percolating: View {
    private let brew = Color(red: 0.78, green: 0.5, blue: 0.28)

    var body: some View {
        Clock { t in
            Glyphs("Percolating", time: t) { g in
                let period = 1 + g.random() * 0.9
                let local = Motion.phase(t + g.random(1) * period, period)
                let burst = local < 0.1 ? Motion.smooth(local / 0.1) : 1 - Motion.smooth((local - 0.1) / 0.3)
                let pop = Motion.window(local, 0.08, 0.1, 0.12, 0.25)
                g.text
                    .foregroundStyle(brew.mix(.white, 0.5 * burst))
                    .offset(y: -9 * burst)
                    .overlay(alignment: .top) {
                        Circle()
                            .stroke(brew.mix(.white, 0.5), lineWidth: 1)
                            .frame(width: 4 + 8 * pop, height: 4 + 8 * pop)
                            .offset(y: -16 - 4 * pop)
                            .opacity(pop)
                    }
            }
        }
    }
}

#Preview {
    Percolating()
}
