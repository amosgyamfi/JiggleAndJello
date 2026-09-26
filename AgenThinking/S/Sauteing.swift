//
//  Sauteing.swift
//  AgenThinking
//  Meaning: Tossing things quickly in a hot pan.
//  Use case: When an agent rapidly iterates over many quick transformations.
//  Motion: The pan flicks up and the letters get tossed, each flipping end over end in 3-D before landing back in the pan.
//

import SwiftUI

struct Sauteing: View {
    private let period = 1.8

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let flick = Motion.window(beat, 0, 0.06, 0.12, 0.25)
            VStack(spacing: 2) {
                Glyphs("Sautéing", time: t, spacing: 1) { g in
                    let toss = Motion.ramp(beat, 0.04 + g.random() * 0.06, 0.55 + g.random(1) * 0.1)
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.8, blue: 0.45).mix(.white, sin(toss * .pi) * 0.4))
                        .rotation3DEffect(.degrees(toss * 360), axis: (x: 1, y: 0, z: 0))
                        .offset(y: -(18 + g.random(2) * 14) * sin(toss * .pi))
                }
                ZStack(alignment: .trailing) {
                    Capsule().fill(Color(white: 0.55)).frame(width: 150, height: 4)
                    Capsule().fill(Color(white: 0.35)).frame(width: 50, height: 4).offset(x: 46)
                }
                .rotationEffect(.degrees(-8 * flick), anchor: .trailing)
                Image(systemName: "flame.fill")
                    .font(.system(size: 10))
                    .foregroundStyle(.orange)
                    .scaleEffect(0.8 + 0.3 * sin(t * 12))
            }
        }
    }
}

#Preview {
    Sauteing()
}
