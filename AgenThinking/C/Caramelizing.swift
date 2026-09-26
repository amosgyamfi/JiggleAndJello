//
//  Caramelizing.swift
//  AgenThinking
//  Meaning: Slowly transforming raw material into something rich.
//  Use case: When an agent refines a rough draft into a polished result.
//  Motion: Sugar-white letters turn amber, then deep caramel from left to right, sag slightly as they melt, and catch a glossy shine.
//

import SwiftUI

struct Caramelizing: View {
    private let amber = Color(red: 1, green: 0.74, blue: 0.3)
    private let caramel = Color(red: 0.66, green: 0.36, blue: 0.12)

    var body: some View {
        Clock { t in
            let heat = (1 - cos(Motion.phase(t, 6) * 2 * .pi)) / 2
            Glyphs("Caramelizing", time: t) { g in
                let cook = Motion.ramp(heat * 1.4 - g.progress * 0.4, 0, 1)
                let color = cook < 0.5
                    ? Color.white.mix(amber, cook * 2)
                    : amber.mix(caramel, (cook - 0.5) * 2)
                g.text
                    .foregroundStyle(color)
                    .scaleEffect(x: 1, y: 1 + 0.1 * cook, anchor: .top)
                    .offset(y: 1.5 * cook * g.pulse(0.4, lag: 0.3))
            }
            .shimmer(t, period: 2.6, color: .white.opacity(0.7), width: 0.12)
        }
    }
}

#Preview {
    Caramelizing()
}
