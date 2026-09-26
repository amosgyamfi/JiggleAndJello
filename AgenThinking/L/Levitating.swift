//
//  Levitating.swift
//  AgenThinking
//  Meaning: Floating effortlessly above the ground.
//  Use case: When an agent is idle but ready, hovering between tasks.
//  Motion: Letters hover at their own gentle rhythms above shadows that shrink and fade as each letter rises.
//

import SwiftUI

struct Levitating: View {
    var body: some View {
        Clock { t in
            Glyphs("Levitating", time: t, spacing: 1) { g in
                let lift = (sin(t * 1.6 + g.random() * 6) + 1) / 2
                VStack(spacing: 4) {
                    g.text
                        .foregroundStyle(Color(red: 0.85, green: 0.8, blue: 1))
                        .offset(y: -6 - 8 * lift)
                        .glow(.purple.opacity(0.5), radius: 6)
                    Ellipse()
                        .fill(.black.opacity(0.5))
                        .frame(width: 12 - 5 * lift, height: 3)
                        .blur(radius: 1.5 + lift)
                        .opacity(0.9 - 0.5 * lift)
                        .overlay(Ellipse().fill(.purple.opacity(0.25 * (1 - lift))))
                }
            }
        }
    }
}

#Preview {
    Levitating()
}
