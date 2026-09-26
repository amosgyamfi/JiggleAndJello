//
//  Combobulating.swift
//  AgenThinking
//  Meaning: Putting things in order; the opposite of discombobulating.
//  Use case: When an agent sorts, organizes, or restructures content.
//  Motion: Letters start in a shuffled order and slide over and under each other into the correct spelling.
//

import SwiftUI

struct Combobulating: View {
    private let word = "Combobulating"
    private let period = 3.6
    private let letterWidth = 14.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let slots = shuffledSlots(round: Int(t / period))
            let order = Motion.ramp(beat, 0.12, 0.6)
            Glyphs(word, time: t) { g in
                let shift = Double(slots[g.index] - g.index) * letterWidth * (1 - order)
                g.text
                    .foregroundStyle(Color.orange.mix(.teal, order))
                    .offset(x: shift, y: sin(order * .pi) * (g.isEven ? -11 : 11))
            }
            .opacity(Motion.window(beat, 0, 0.08, 0.9, 1))
        }
    }

    private func shuffledSlots(round: Int) -> [Int] {
        let order = (0..<word.count).sorted { Motion.random($0, round) < Motion.random($1, round) }
        var slots = Array(repeating: 0, count: word.count)
        for (slot, index) in order.enumerated() { slots[index] = slot }
        return slots
    }
}

#Preview {
    Combobulating()
}
