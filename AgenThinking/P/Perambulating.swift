//
//  Perambulating.swift
//  AgenThinking
//  Meaning: Walking about, surveying the area on foot.
//  Use case: When an agent walks a directory tree or traverses a graph.
//  Motion: Letters march single file with high knee lifts as the word paces back and forth, leaving fading footprints behind.
//

import SwiftUI

struct Perambulating: View {
    private let period = 6.0

    var body: some View {
        Clock { t in
            let pace = Motion.triangle(Motion.phase(t, period))
            let heading: Double = Motion.phase(t, period) < 0.5 ? 1 : -1
            ZStack {
                ForEach(0..<6, id: \.self) { k in
                    let stepTime = t - Double(k) * 0.35
                    let past = Motion.triangle(Motion.phase(stepTime, period)) * 45
                    Image(systemName: "shoeprints.fill")
                        .font(.system(size: 9))
                        .foregroundStyle(.white.opacity(0.25 * (1 - Double(k) / 6)))
                        .rotationEffect(.degrees(heading > 0 ? 90 : -90))
                        .offset(x: past - heading * 70, y: 20 + (k.isMultiple(of: 2) ? -2 : 2))
                }

                Glyphs("Perambulating", time: t) { g in
                    let order = heading > 0 ? 1 - g.progress : g.progress
                    let knee = max(0, sin((t * 2.4 - order * 1.2) * 2 * .pi))
                    g.text
                        .foregroundStyle(Color(red: 0.75, green: 0.85, blue: 1))
                        .offset(y: -6 * pow(knee, 2))
                        .rotationEffect(.degrees(heading * 8 * knee), anchor: .bottom)
                }
                .offset(x: pace * 45)
            }
        }
    }
}

#Preview {
    Perambulating()
}
