//
//  Osmosing.swift
//  AgenThinking
//  Meaning: Absorbing gradually, as if through a membrane.
//  Use case: When an agent slowly absorbs documentation or context before working.
//  Motion: A dashed membrane drifts through the word; letters that pass through it jiggle and turn from blue to green.
//

import SwiftUI

struct Osmosing: View {
    private let letterWidth = 15.0

    var body: some View {
        Clock { t in
            let membrane = sin(t * 0.7) * 70
            ZStack {
                Glyphs("Osmosing", time: t, spacing: 1) { g in
                    let letterX = (g.i - Double(g.count - 1) / 2) * letterWidth
                    let crossed = Motion.ramp(membrane - letterX, -6, 6)
                    let crossing = Motion.bell((membrane - letterX) / 10)
                    g.text
                        .foregroundStyle(Color.blue.mix(.mint, crossed))
                        .offset(x: sin(t * 30 + g.i) * 1.5 * crossing, y: cos(t * 26 + g.i) * 1.5 * crossing)
                        .scaleEffect(1 - 0.12 * crossing)
                }
                Rectangle()
                    .stroke(.white.opacity(0.5), style: StrokeStyle(lineWidth: 1.2, dash: [3, 3]))
                    .frame(width: 0.5, height: 44)
                    .offset(x: membrane)
            }
        }
    }
}

#Preview {
    Osmosing()
}
