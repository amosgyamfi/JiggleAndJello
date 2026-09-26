//
//  Tinkering.swift
//  AgenThinking
//  Meaning: Making small adjustments to try to fix or improve something.
//  Use case: When an agent makes small incremental fixes.
//  Motion: A wrench hops from letter to letter, twisting each one a few degrees back and forth as if tightening a bolt.
//

import SwiftUI

struct Tinkering: View {
    private let letterWidth = 12.0

    var body: some View {
        Clock { t in
            let word = "Tinkering"
            let step = t / 0.55
            let current = Int(step) % word.count
            let local = step - floor(step)
            ZStack {
                Glyphs(word, time: t) { g in
                    let active = g.index == current
                    let twist = active ? sin(local * 3 * .pi) * 14 * (1 - local) : 0
                    g.text
                        .foregroundStyle(active ? Color(red: 1, green: 0.8, blue: 0.4) : .white.opacity(0.8))
                        .rotationEffect(.degrees(twist))
                }
                Image(systemName: "wrench.adjustable.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(white: 0.75))
                    .rotationEffect(.degrees(-45 + sin(local * 3 * .pi) * 25))
                    .offset(
                        x: (Double(current) - Double(word.count - 1) / 2) * letterWidth,
                        y: -26 - 6 * Motion.hop(min(local / 0.25, 1))
                    )
            }
        }
    }
}

#Preview {
    Tinkering()
}
