//
//  Leavening.swift
//  AgenThinking
//  Meaning: Rising slowly as air builds up inside.
//  Use case: When an agent's result gradually grows in quality or size over time.
//  Motion: Letters slowly puff up and rise as little air bubbles form inside them, then gently deflate to rise again.
//

import SwiftUI

struct Leavening: View {
    var body: some View {
        Clock { t in
            let rise = Motion.smooth(Motion.phase(t, 5) / 0.85) * (1 - Motion.ramp(Motion.phase(t, 5), 0.88, 1))
            Glyphs("Leavening", time: t, spacing: 1) { g in
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.95, blue: 0.82))
                    .scaleEffect(0.85 + 0.3 * rise + 0.03 * g.wave(0.6, lag: 0.15), anchor: .bottom)
                    .offset(y: -4 * rise)
                    .overlay {
                        Circle()
                            .strokeBorder(.white.opacity(0.7), lineWidth: 0.8)
                            .frame(width: 3 + 4 * rise, height: 3 + 4 * rise)
                            .offset(x: (g.random() - 0.5) * 6, y: (g.random(1) - 0.5) * 12)
                            .opacity(rise > g.random(2) ? 1 : 0)
                    }
            }
        }
    }
}

#Preview {
    Leavening()
}
