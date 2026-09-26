//
//  Booping.swift
//  AgenThinking
//  Meaning: A light, playful tap.
//  Use case: When an agent pings a service, sends a quick check, or nudges a process.
//  Motion: A pink dot hops across the word and each letter squishes when it gets booped.
//

import SwiftUI

struct Booping: View {
    private let word = "Booping"
    private let step = 0.32
    private let letterWidth = 15.0

    var body: some View {
        Clock { t in
            let count = word.count
            let current = Int(t / step) % (count + 3)
            let hop = Motion.phase(t, step)
            let dotX = (Double(current - 1) + hop - Double(count - 1) / 2) * letterWidth
            ZStack {
                Glyphs(word, time: t, spacing: 1) { g in
                    let squish = current - 1 == g.index ? 1 - Motion.smooth(hop / 0.45) : 0
                    g.text
                        .foregroundStyle(Color.white.mix(.pink, squish))
                        .scaleEffect(x: 1 + 0.3 * squish, y: 1 - 0.35 * squish, anchor: .bottom)
                }
                Circle()
                    .fill(.pink)
                    .frame(width: 8, height: 8)
                    .glow(.pink, radius: 6)
                    .offset(x: dotX, y: -20 - 14 * Motion.hop(hop))
                    .opacity(current >= 1 && current <= count ? 1 : 0)
            }
        }
    }
}

#Preview {
    Booping()
}
