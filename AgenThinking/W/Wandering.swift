//
//  Wandering.swift
//  AgenThinking
//  Meaning: Moving about aimlessly, without a fixed course.
//  Use case: When an agent explores freely before settling on an approach.
//  Motion: Each letter drifts on its own smooth, meandering noise path while a compass needle swings, searching for a heading.
//

import SwiftUI

struct Wandering: View {
    var body: some View {
        Clock { t in
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                        .frame(width: 20, height: 20)
                    Image(systemName: "location.north.fill")
                        .font(.system(size: 10))
                        .foregroundStyle(.red)
                        .rotationEffect(.degrees(Motion.noise(t * 0.6, seed: 11) * 160))
                }
                Glyphs("Wandering", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.75, green: 0.95, blue: 0.8))
                        .offset(x: g.noise(0.5, salt: 1) * 5, y: g.noise(0.45, salt: 2) * 9)
                        .rotationEffect(.degrees(g.noise(0.4, salt: 3) * 12))
                }
            }
        }
    }
}

#Preview {
    Wandering()
}
