//
//  Hyperspacing.swift
//  AgenThinking
//  Meaning: Jumping ahead at impossible speed.
//  Use case: When an agent skips ahead using a cache, index, or shortcut.
//  Motion: Star streaks stretch out from the center as the letters stretch and spread, then snap back after a flash.
//

import SwiftUI

struct Hyperspacing: View {
    private let period = 3.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let jump = pow(Motion.ramp(beat, 0.2, 0.75), 2)
            let flash = Motion.window(beat, 0.72, 0.76, 0.78, 0.9)
            ZStack {
                ForEach(0..<18, id: \.self) { k in
                    let angle = Double(k) / 18 * 2 * .pi + Motion.random(k, 1) * 0.3
                    let reach = 20 + (60 + Motion.random(k, 2) * 60) * jump
                    Capsule()
                        .fill(LinearGradient(colors: [.clear, .white], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 4 + 70 * jump, height: 1.5)
                        .offset(x: reach)
                        .rotationEffect(.radians(angle))
                        .opacity(0.2 + 0.8 * jump)
                }

                Glyphs("Hyperspacing", time: t) { g in
                    g.text
                        .foregroundStyle(Agent.grok)
                        .scaleEffect(x: 1 + 0.9 * jump * abs(g.centered), y: 1 - 0.2 * jump)
                        .offset(x: g.centered * 26 * jump)
                        .blur(radius: 1.5 * jump)
                }

                Ellipse()
                    .fill(.white)
                    .frame(width: 260, height: 70)
                    .blur(radius: 24)
                    .opacity(0.8 * flash)
                    .blendMode(.plusLighter)
            }
        }
    }
}

#Preview {
    Hyperspacing()
}
