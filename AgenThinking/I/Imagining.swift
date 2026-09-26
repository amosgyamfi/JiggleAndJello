//
//  Imagining.swift
//  AgenThinking
//  Meaning: Dreaming up something that doesn't exist yet.
//  Use case: When an agent generates creative concepts, stories, or designs.
//  Motion: Pastel, hue-shifting letters drift weightlessly as in a dream, softly blurring in and out of focus.
//

import SwiftUI

struct Imagining: View {
    var body: some View {
        Clock { t in
            Glyphs("Imagining", time: t, spacing: 1) { g in
                let dream = (g.noise(0.4, salt: 3) + 1) / 2
                g.text
                    .offset(x: g.noise(0.3) * 4, y: g.noise(0.35, salt: 1) * 7)
                    .rotationEffect(.degrees(g.noise(0.3, salt: 2) * 14))
                    .blur(radius: dream * 1.5)
                    .scaleEffect(0.95 + 0.12 * dream)
            }
            .paint(LinearGradient(
                colors: [Color(red: 1, green: 0.7, blue: 0.85), Color(red: 0.75, green: 0.7, blue: 1), Color(red: 0.6, green: 0.9, blue: 1)],
                startPoint: .leading, endPoint: .trailing
            ))
            .hueRotation(.degrees(sin(t * 0.5) * 60))
            .glow(.white.opacity(0.3), radius: 10)
        }
    }
}

#Preview {
    Imagining()
}
