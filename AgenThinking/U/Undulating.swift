//
//  Undulating.swift
//  AgenThinking
//  Meaning: Moving with a smooth, wavelike rise and fall.
//  Use case: A calm, continuous background-processing state.
//  Motion: A tall ocean swell rolls through the letters, stretching crests and tinting them from deep blue to foam white.
//

import SwiftUI

struct Undulating: View {
    var body: some View {
        Clock { t in
            Glyphs("Undulating", time: t, spacing: 1) { g in
                let swell = g.wave(0.6, lag: 0.07)
                let crest = (swell + 1) / 2
                g.text
                    .foregroundStyle(Color(red: 0.1, green: 0.4, blue: 0.9).mix(Color(red: 0.85, green: 0.97, blue: 1), crest))
                    .scaleEffect(x: 1, y: 0.85 + 0.35 * crest, anchor: .bottom)
                    .offset(y: -9 * swell)
                    .rotationEffect(.degrees(cos((g.time * 0.6 - g.i * 0.07) * 2 * .pi) * -12))
            }
        }
    }
}

#Preview {
    Undulating()
}
