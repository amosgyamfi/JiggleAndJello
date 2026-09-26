//
//  Flambeing.swift
//  AgenThinking
//  Meaning: A dramatic burst of flame for a showy finish.
//  Use case: When an agent does a bold, flashy final step, like a big refactor landing.
//  Motion: Low blue flames lick above amber letters until a whoosh flares them white-hot and tall, then they die down.
//

import SwiftUI

struct Flambeing: View {
    private let period = 2.6

    var body: some View {
        Clock { t in
            let since = Motion.phase(t, period) * period
            let flare = since < 0.15 ? since / 0.15 : exp(-(since - 0.15) * 2.4)
            Glyphs("Flambéing", time: t) { g in
                let lick = (g.noise(5) + 1) / 2
                g.text
                    .foregroundStyle(Color.orange.mix(.white, flare * 0.8))
                    .scaleEffect(1 + 0.12 * flare)
                    .overlay(alignment: .top) {
                        Image(systemName: "flame.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(LinearGradient(
                                colors: [Color.cyan.mix(.yellow, flare), Color.blue.mix(.orange, flare), .clear],
                                startPoint: .bottom, endPoint: .top
                            ))
                            .scaleEffect(x: 1, y: 0.5 + 0.5 * lick + 1.6 * flare, anchor: .bottom)
                            .offset(y: -12)
                    }
            }
            .glow(.orange, radius: 3 + 12 * flare)
        }
    }
}

#Preview {
    Flambeing()
}
