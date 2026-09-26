//
//  Cogitating.swift
//  AgenThinking
//  Meaning: Thinking deeply and methodically.
//  Use case: When an agent works through a step-by-step chain of reasoning.
//  Motion: Two meshed gears turn while a clockwork tick steps through the letters, nudging each one like an escapement.
//

import SwiftUI

struct Cogitating: View {
    private let tick = 0.16

    var body: some View {
        Clock { t in
            let step = Int(t / tick)
            let within = Motion.phase(t, tick)
            HStack(spacing: 8) {
                ZStack {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 20))
                        .rotationEffect(.degrees(Double(step) * 15))
                        .offset(x: -6, y: -4)
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 13))
                        .rotationEffect(.degrees(Double(step) * -22.5 + 11))
                        .offset(x: 8, y: 7)
                }
                .foregroundStyle(Color(white: 0.6))

                Glyphs("Cogitating", time: t) { g in
                    let active = step % (g.count + 4) == g.index
                    let nudge = active ? 1 - Motion.smooth(within) : 0
                    g.text
                        .foregroundStyle(active ? Color.orange : Color(white: 0.8))
                        .rotationEffect(.degrees(-12 * nudge), anchor: .bottom)
                        .offset(y: 3 * nudge)
                }
            }
        }
    }
}

#Preview {
    Cogitating()
}
