//
//  Baking.swift
//  AgenThinking
//  Meaning: Letting an idea sit in the heat until it is fully done.
//  Use case: While an agent runs a long build, compile, or render step.
//  Motion: Pale dough letters rise from the baseline and brown to a golden crust over a glowing oven.
//

import SwiftUI

struct Baking: View {
    private let dough = Color(red: 0.97, green: 0.91, blue: 0.76)
    private let crust = Color(red: 0.83, green: 0.52, blue: 0.2)

    var body: some View {
        Clock { t in
            let bake = (1 - cos(Motion.phase(t, 5) * 2 * .pi)) / 2
            ZStack {
                Capsule()
                    .fill(.orange)
                    .frame(width: 200, height: 10)
                    .blur(radius: 14)
                    .opacity(0.25 + 0.55 * bake)
                    .offset(y: 24)

                Glyphs("Baking", time: t, spacing: 1) { g in
                    let doneness = Motion.ramp(bake, g.random() * 0.3, 0.7 + g.random(1) * 0.3)
                    g.text
                        .foregroundStyle(dough.mix(crust, doneness))
                        .scaleEffect(x: 1 + 0.06 * doneness, y: 0.8 + 0.25 * doneness, anchor: .bottom)
                        .offset(y: g.wave(2.5, lag: 0.3) * 0.8 * bake)
                }
                .shadow(color: .orange.opacity(0.6 * bake), radius: 8)
            }
        }
    }
}

#Preview {
    Baking()
}
