//
//  Puzzling.swift
//  AgenThinking
//  Meaning: Trying to figure out how the pieces fit.
//  Use case: When an agent is fitting parts of a solution together, like types or API contracts.
//  Motion: Letter tiles start turned the wrong way and click around in 90° steps, one by one, until the whole puzzle aligns.
//

import SwiftUI

struct Puzzling: View {
    private let period = 4.2

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let round = Int(t / period)
            let solved = Motion.window(beat, 0.8, 0.84, 0.92, 1)
            HStack(spacing: 8) {
                Image(systemName: "puzzlepiece.extension.fill")
                    .foregroundStyle(Color.orange.mix(.green, solved))
                    .rotationEffect(.degrees(solved * 20))
                Glyphs("Puzzling", time: t, spacing: 2) { g in
                    let turns = Double(1 + Int(g.random(round) * 3))
                    let start = 0.05 + g.random(round + 1) * 0.5
                    let progress = Motion.ramp(beat, start, start + 0.2) * turns
                    let stepped = floor(progress) + Motion.smooth((progress - floor(progress)) * 1.4)
                    let aligned = progress >= turns
                    g.text
                        .foregroundStyle(aligned ? Color.white.mix(.green, solved) : Color.orange)
                        .frame(width: 20, height: 26)
                        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(aligned ? Color.white.opacity(0.2) : .orange.opacity(0.6)))
                        .rotationEffect(.degrees((turns - stepped) * 90))
                }
                .opacity(Motion.window(beat, 0, 0.04, 0.94, 1))
            }
        }
    }
}

#Preview {
    Puzzling()
}
