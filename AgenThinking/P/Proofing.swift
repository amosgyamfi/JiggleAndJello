//
//  Proofing.swift
//  AgenThinking
//  Meaning: Checking carefully for mistakes; proofreading.
//  Use case: When an agent reviews its own output, lints, or verifies a diff.
//  Motion: A caret scans the word, underlining each checked letter green; one typo glows red until the caret corrects it.
//

import SwiftUI

struct Proofing: View {
    private let word = "Proofing"
    private let typos = Array("qzxvjk").map(String.init)
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let round = Int(t / period)
            let caret = min(max((beat - 0.05) / 0.7, 0), 1) * Double(word.count)
            let typo = 1 + Int(Motion.random(round, 3) * Double(word.count - 2))
            Glyphs(word, time: t, spacing: 1) { g in
                let checked = caret > g.i + 1
                let fixed = g.index == typo && checked
                let fixFlash = fixed ? 1 - Motion.ramp(caret - g.i - 1, 0, 1.5) : 0
                let wrong = g.index == typo && !checked
                Text(wrong ? typos[round % typos.count] : g.character)
                    .foregroundStyle(wrong ? Color.red : Color.white.mix(.green, fixFlash))
                    .strikethrough(wrong, color: .red)
                    .scaleEffect(1 + 0.3 * fixFlash)
                    .overlay(alignment: .bottom) {
                        Capsule()
                            .fill(.green)
                            .frame(height: 2)
                            .scaleEffect(x: checked ? 1 - Motion.ramp(beat, 0.88, 1) : 0, anchor: .leading)
                            .offset(y: 2)
                    }
                    .overlay(alignment: .leading) {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 2, height: 26)
                            .offset(x: -1)
                            .opacity(Int(caret) == g.index && Motion.phase(t, 0.5) < 0.6 ? 1 : 0)
                    }
            }
        }
    }
}

#Preview {
    Proofing()
}
