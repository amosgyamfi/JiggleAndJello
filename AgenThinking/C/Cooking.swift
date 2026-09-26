//
//  Cooking.swift
//  AgenThinking
//  Meaning: Actively preparing something over heat.
//  Use case: While an agent actively generates or transforms content.
//  Motion: Letters sizzle with tiny rapid jumps over flickering flames, glowing from orange to red.
//

import SwiftUI

struct Cooking: View {
    var body: some View {
        Clock { t in
            VStack(spacing: -2) {
                Glyphs("Cooking", time: t, spacing: 1) { g in
                    let sizzle = Motion.random(g.index, Int(t * 18)) - 0.5
                    g.text
                        .foregroundStyle(Color.orange.mix(.red, (sin(t * 3 + g.i) + 1) / 2 * 0.7))
                        .offset(y: sizzle * 3.5)
                        .rotationEffect(.degrees(sizzle * 6))
                }
                .glow(.orange.opacity(0.6), radius: 6)

                HStack(spacing: 10) {
                    ForEach(0..<6, id: \.self) { k in
                        Image(systemName: "flame.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(LinearGradient(colors: [.yellow, .orange, .red], startPoint: .bottom, endPoint: .top))
                            .scaleEffect(x: 1, y: 0.7 + 0.5 * (Motion.noise(t * 6, seed: k) + 1) / 2, anchor: .bottom)
                    }
                }
                .padding(.top, 6)
            }
        }
    }
}

#Preview {
    Cooking()
}
