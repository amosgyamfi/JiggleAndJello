//
//  Gallivanting.swift
//  AgenThinking
//  Meaning: Roaming from place to place for fun.
//  Use case: When an agent browses across many websites, repos, or services.
//  Motion: The word travels endlessly across the card like a marquee, led by a spinning globe, letters bobbing as they go.
//

import SwiftUI

struct Gallivanting: View {
    private let lane = 300.0

    var body: some View {
        Clock { t in
            let x = Motion.phase(t, 6) * lane
            ZStack {
                traveler(t).offset(x: x - lane / 2)
                traveler(t).offset(x: x - lane * 1.5)
            }
            .frame(width: lane)
            .mask(LinearGradient(stops: [
                .init(color: .clear, location: 0),
                .init(color: .black, location: 0.15),
                .init(color: .black, location: 0.85),
                .init(color: .clear, location: 1),
            ], startPoint: .leading, endPoint: .trailing))
        }
    }

    private func traveler(_ t: Double) -> some View {
        HStack(spacing: 6) {
            Glyphs("Gallivanting", time: t) { g in
                g.text
                    .foregroundStyle(Color(hue: 0.08 + 0.1 * g.progress, saturation: 0.5, brightness: 1))
                    .offset(y: -abs(sin(t * 5 - g.i * 0.7)) * 3.5)
            }
            Image(systemName: "globe.americas.fill")
                .foregroundStyle(.teal)
                .rotationEffect(.degrees(t * 90))
        }
        .fixedSize()
    }
}

#Preview {
    Gallivanting()
}
