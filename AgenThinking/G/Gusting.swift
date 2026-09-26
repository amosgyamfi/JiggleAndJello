//
//  Gusting.swift
//  AgenThinking
//  Meaning: A sudden rush of wind.
//  Use case: When an agent suddenly pushes a burst of changes or requests.
//  Motion: Wind streaks rush across as a gust sweeps through, bending letters over from their base, then they spring upright.
//

import SwiftUI

struct Gusting: View {
    private let period = 2.4

    var body: some View {
        Clock { t in
            ZStack {
                Particles(6, time: t, period: 1.2) { k, life in
                    Capsule()
                        .fill(LinearGradient(colors: [.clear, .white.opacity(0.5)], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 30 + Motion.random(k, 1) * 30, height: 1.5)
                        .offset(x: -160 + life * 320, y: (Motion.random(k, 2) - 0.5) * 50)
                }

                Glyphs("Gusting", time: t, spacing: 1) { g in
                    let gust = g.sweep(period, width: 0.3)
                    let flutter = sin(t * 14 + g.i) * 3 * gust
                    g.text
                        .foregroundStyle(Color(red: 0.8, green: 0.95, blue: 1).mix(.white, gust))
                        .rotationEffect(.degrees(28 * gust + flutter), anchor: .bottom)
                        .offset(x: 6 * gust)
                }
            }
        }
    }
}

#Preview {
    Gusting()
}
