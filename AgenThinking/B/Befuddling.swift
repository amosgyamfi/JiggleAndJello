//
//  Befuddling.swift
//  AgenThinking
//  Meaning: Momentarily confused by something unexpected.
//  Use case: When an agent hits ambiguous input and needs a moment to make sense of it.
//  Motion: Letters tilt and drift in random, uncoordinated directions and blur in and out while a question mark wobbles.
//

import SwiftUI

struct Befuddling: View {
    var body: some View {
        Clock { t in
            Glyphs("Befuddling", time: t) { g in
                let wobble = g.noise(0.8)
                g.text
                    .foregroundStyle(Color(hue: 0.76 + 0.05 * wobble, saturation: 0.35, brightness: 1))
                    .rotationEffect(.degrees(wobble * 22))
                    .offset(x: g.noise(0.6, salt: 3) * 3, y: g.noise(0.7, salt: 5) * 5)
                    .blur(radius: max(0, g.noise(0.5, salt: 9)) * 1.6)
            }
            .overlay(alignment: .topTrailing) {
                Text("?")
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundStyle(.purple)
                    .rotationEffect(.degrees(sin(t * 2.5) * 22))
                    .offset(x: 16, y: -16 + sin(t * 3) * 3)
            }
        }
    }
}

#Preview {
    Befuddling()
}
