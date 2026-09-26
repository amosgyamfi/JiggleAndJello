//
//  Billowing.swift
//  AgenThinking
//  Meaning: Swelling and expanding like a cloud or a sail filling with wind.
//  Use case: When an agent's context or output is growing, such as gathering many sources.
//  Motion: Soft cloud puffs drift behind while letters swell in a slow wave and the word turns like a sail in 3-D.
//

import SwiftUI

struct Billowing: View {
    var body: some View {
        Clock { t in
            ZStack {
                ForEach(0..<3, id: \.self) { k in
                    let drift = sin(t * 0.4 + Double(k) * 2)
                    Circle()
                        .fill(.white.opacity(0.08))
                        .frame(width: 70 + Double(k) * 20)
                        .blur(radius: 10)
                        .offset(x: Double(k - 1) * 70 + drift * 16, y: cos(t * 0.3 + Double(k)) * 6)
                }

                Glyphs("Billowing", time: t) { g in
                    let swell = g.pulse(0.45, lag: 0.08)
                    g.text
                        .foregroundStyle(Color(red: 0.8, green: 0.9, blue: 1).mix(.white, swell))
                        .scaleEffect(x: 0.95 + 0.2 * swell, y: 0.9 + 0.3 * swell)
                        .offset(y: -4 * swell)
                }
                .rotation3DEffect(.degrees(sin(t * 0.6) * 22), axis: (x: 0, y: 1, z: 0), perspective: 0.5)
                .glow(.white.opacity(0.4), radius: 8)
            }
        }
    }
}

#Preview {
    Billowing()
}
