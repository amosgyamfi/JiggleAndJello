//
//  Waddling.swift
//  AgenThinking
//  Meaning: Walking with short steps and a clumsy side-to-side sway, like a duck or penguin.
//  Use case: When progress is steady but slow and a little clumsy.
//  Motion: The word rocks from foot to foot around its bottom corners, each rock lifting alternate letters, while it shuffles slowly forward.
//

import SwiftUI

struct Waddling: View {
    var body: some View {
        Clock { t in
            let step = sin(t * 2 * .pi / 0.9)
            let drift = Motion.triangle(Motion.phase(t, 8)) * 30 - 15
            HStack(spacing: 6) {
                Image(systemName: "bird.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.yellow)
                    .scaleEffect(x: -1)
                    .rotationEffect(.degrees(step * 12), anchor: .bottom)
                Glyphs("Waddling", time: t) { g in
                    let lift = g.isEven ? max(0, step) : max(0, -step)
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.88, blue: 0.5))
                        .offset(y: -3 * lift)
                }
            }
            .rotationEffect(.degrees(step * 6), anchor: step > 0 ? .bottomLeading : .bottomTrailing)
            .offset(x: drift)
        }
    }
}

#Preview {
    Waddling()
}
