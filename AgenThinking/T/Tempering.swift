//
//  Tempering.swift
//  AgenThinking
//  Meaning: Heating and cooling metal (or chocolate) to make it strong and glossy.
//  Use case: When an agent hardens code with tests or tones down an overly strong response.
//  Motion: Letters glow white-hot, cool through orange into steel blue with a quench shiver, then a glossy highlight sweeps across.
//

import SwiftUI

struct Tempering: View {
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            Glyphs("Tempering", time: t) { g in
                let cool = Motion.ramp(beat, 0.1 + g.progress * 0.2, 0.45 + g.progress * 0.2)
                let heat = 1 - cool
                let quench = cool > 0 && cool < 1 ? sin(t * 60 + g.i) * 1.2 : 0
                g.text
                    .foregroundStyle(heatColor(heat))
                    .shadow(color: .orange.opacity(0.8 * heat), radius: 6 * heat)
                    .offset(x: quench)
            }
            .shimmer(t, period: period, color: .white, width: 0.12)
        }
    }

    private func heatColor(_ heat: Double) -> Color {
        let steel = Color(red: 0.6, green: 0.72, blue: 0.85)
        let ember = Color(red: 1, green: 0.45, blue: 0.1)
        let whiteHot = Color(red: 1, green: 0.97, blue: 0.85)
        return heat < 0.5 ? steel.mix(ember, heat * 2) : ember.mix(whiteHot, (heat - 0.5) * 2)
    }
}

#Preview {
    Tempering()
}
