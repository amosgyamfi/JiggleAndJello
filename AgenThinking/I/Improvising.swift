//
//  Improvising.swift
//  AgenThinking
//  Meaning: Making it up on the spot.
//  Use case: When an agent adapts on the fly after a plan breaks.
//  Motion: Every beat each letter picks a fresh, random move (hop, spin, grow, tilt, or dip), so no two bars are alike.
//

import SwiftUI

struct Improvising: View {
    private let beat = 0.7

    var body: some View {
        Clock { t in
            Glyphs("Improvising", time: t) { g in
                let bar = g.cycle(beat, lag: 0.03)
                let amount = sin(g.phase(beat, lag: 0.03) * .pi)
                let move = Move.pick(Motion.random(g.index, bar))
                g.text
                    .foregroundStyle(move.color.mix(.white, 1 - amount))
                    .offset(y: move.lift * amount)
                    .rotationEffect(.degrees(move.spin * amount))
                    .scaleEffect(1 + move.grow * amount)
            }
        }
    }
}

private enum Move: CaseIterable {
    case hop, spin, grow, tilt, dip

    static func pick(_ roll: Double) -> Move {
        allCases[min(Int(roll * Double(allCases.count)), allCases.count - 1)]
    }

    var lift: Double { self == .hop ? -10 : self == .dip ? 7 : 0 }
    var spin: Double { self == .spin ? 180 : self == .tilt ? -25 : 0 }
    var grow: Double { self == .grow ? 0.35 : 0 }

    var color: Color {
        switch self {
        case .hop: .yellow
        case .spin: .cyan
        case .grow: .pink
        case .tilt: .mint
        case .dip: .orange
        }
    }
}

#Preview {
    Improvising()
}
