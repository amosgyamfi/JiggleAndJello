//
//  Jitterbugging.swift
//  AgenThinking
//  Meaning: Swing dancing with lively partner spins.
//  Use case: When an agent pairs up work items and swaps them rapidly, like a merge pass.
//  Motion: Letters pair off and spin around each other in half-turns on the swing beat, trading places and back.
//

import SwiftUI

struct Jitterbugging: View {
    private let beat = 0.55
    private let half = 7.0

    var body: some View {
        Clock { t in
            Glyphs("Jitterbugging", time: t) { g in
                let pair = g.index / 2
                let paired = pair * 2 + 1 < g.count
                let local = t - Double(pair) * 0.06
                let turns = Double(Int(local / beat) % 2) + Motion.smooth(Motion.phase(local, beat) / 0.7)
                let angle = turns * .pi
                let side: Double = g.isEven ? -1 : 1
                g.text
                    .foregroundStyle(pair.isMultiple(of: 2) ? Color(red: 1, green: 0.4, blue: 0.45) : .teal)
                    .offset(
                        x: paired ? side * half * cos(angle) - side * half : 0,
                        y: paired ? side * half * sin(angle) : -abs(sin(local * 2 * .pi / beat)) * 5
                    )
            }
        }
    }
}

#Preview {
    Jitterbugging()
}
