//
//  Inferring.swift
//  AgenThinking
//  Meaning: Reaching a conclusion from evidence.
//  Use case: When an agent reasons from clues, logs, or context to an answer.
//  Motion: A chain of reasoning links node to node beneath the letters, lighting each step, until a "∴ therefore" appears.
//

import SwiftUI

struct Inferring: View {
    private let word = "Inferring"
    private let letterWidth = 15.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            let chain = Motion.ramp(beat, 0.05, 0.7)
            let conclude = Motion.window(beat, 0.7, 0.78, 0.9, 1)
            HStack(spacing: 8) {
                VStack(spacing: 6) {
                    Glyphs(word, time: t) { g in
                        let reached = chain >= g.progress
                        g.text
                            .foregroundStyle(reached ? Color.cyan.mix(.white, conclude) : Color(white: 0.4))
                            .frame(width: letterWidth)
                    }
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(.cyan)
                            .frame(width: letterWidth * Double(word.count - 1) * chain, height: 1.5)
                            .offset(x: letterWidth / 2)
                        HStack(spacing: 0) {
                            ForEach(0..<word.count, id: \.self) { k in
                                Circle()
                                    .fill(chain >= Double(k) / Double(word.count - 1) ? Color.cyan : Color(white: 0.3))
                                    .frame(width: 5, height: 5)
                                    .frame(width: letterWidth)
                            }
                        }
                    }
                }
                Text("∴")
                    .foregroundStyle(.cyan)
                    .scaleEffect(conclude)
                    .glow(.cyan, radius: 6)
            }
        }
    }
}

#Preview {
    Inferring()
}
