//
//  Misting.swift
//  AgenThinking
//  Meaning: A fine, soft haze settling over things.
//  Use case: When an agent's view is partially obscured, such as waiting on flaky or partial data.
//  Motion: A soft fog bank drifts across the word, softening and fading letters beneath it, while fine droplets hang in the air.
//

import SwiftUI

struct Misting: View {
    private let period = 5.0

    var body: some View {
        Clock { t in
            let drift = Motion.phase(t, period) * 1.8 - 0.4
            ZStack {
                Glyphs("Misting", time: t, spacing: 1) { g in
                    let fog = g.sweep(period, width: 0.35)
                    g.text
                        .foregroundStyle(Color(red: 0.85, green: 0.92, blue: 0.98))
                        .blur(radius: 2.5 * fog)
                        .opacity(1 - 0.65 * fog)
                }

                ForEach(0..<3, id: \.self) { k in
                    Ellipse()
                        .fill(.white.opacity(0.12))
                        .frame(width: 90, height: 34)
                        .blur(radius: 12)
                        .offset(x: (drift - 0.5) * 220 + Double(k - 1) * 30, y: Double(k - 1) * 8)
                }

                Particles(18, time: t, period: 4) { k, life in
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 1.5, height: 1.5)
                        .offset(x: (Motion.random(k, 1) - 0.5) * 220 + life * 20, y: (Motion.random(k, 2) - 0.5) * 60 + sin(life * 6) * 3)
                        .opacity(Motion.window(life, 0, 0.3, 0.7, 1))
                }
            }
        }
    }
}

#Preview {
    Misting()
}
