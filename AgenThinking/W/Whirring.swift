//
//  Whirring.swift
//  AgenThinking
//  Meaning: Making a continuous low buzzing sound from rapid spinning.
//  Use case: When an agent's machinery is running at full speed.
//  Motion: A fan spins at a blur while the letters buzz with high-frequency micro-vibration and a faint motion blur.
//

import SwiftUI

struct Whirring: View {
    var body: some View {
        Clock { t in
            let revving = 0.6 + 0.4 * (sin(t * 0.9) + 1) / 2
            HStack(spacing: 8) {
                Image(systemName: "fan.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(white: 0.8))
                    .rotationEffect(.degrees(t * 1_400 * revving))
                    .blur(radius: 1.2 * revving)
                Glyphs("Whirring", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.75, green: 0.85, blue: 0.95))
                        .offset(x: sin(t * 90 + g.i * 1.7) * 0.9 * revving, y: sin(t * 110 + g.i * 2.3) * 0.9 * revving)
                        .blur(radius: 0.4 * revving)
                }
            }
        }
    }
}

#Preview {
    Whirring()
}
