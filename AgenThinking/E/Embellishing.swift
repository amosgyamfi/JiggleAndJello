//
//  Embellishing.swift
//  AgenThinking
//  Meaning: Adding decorative detail to make something richer.
//  Use case: When an agent adds polish: formatting, examples, or extra detail to an answer.
//  Motion: Serif letters in shimmering gold get adorned one by one with a pop and a twinkling ornament.
//

import SwiftUI

struct Embellishing: View {
    private let gold = LinearGradient(
        colors: [Color(red: 1, green: 0.85, blue: 0.4), Color(red: 0.8, green: 0.55, blue: 0.15), Color(red: 1, green: 0.9, blue: 0.55)],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )

    var body: some View {
        Clock { t in
            Glyphs("Embellishing", time: t) { g in
                let local = g.phase(3.2, lag: -0.18)
                let adorn = Motion.window(local, 0, 0.08, 0.2, 0.35)
                g.text
                    .scaleEffect(1 + 0.2 * adorn)
                    .rotationEffect(.degrees(-8 * adorn))
                    .overlay(alignment: g.isEven ? .top : .bottom) {
                        Text("✦")
                            .font(.system(size: 10))
                            .scaleEffect(adorn)
                            .rotationEffect(.degrees(adorn * 180))
                            .offset(y: g.isEven ? -12 : 12)
                    }
            }
            .fontDesign(.serif)
            .paint(gold)
            .shimmer(t, period: 2.8, color: .white.opacity(0.8), width: 0.1)
        }
    }
}

#Preview {
    Embellishing()
}
