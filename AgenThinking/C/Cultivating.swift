//
//  Cultivating.swift
//  AgenThinking
//  Meaning: Patiently tending something so it grows.
//  Use case: When an agent iteratively improves a model, prompt, or codebase over time.
//  Motion: Letters sway like a row of crops; a watering drop moves down the row and each watered letter grows taller and greener.
//

import SwiftUI

struct Cultivating: View {
    private let period = 4.5

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            VStack(spacing: 0) {
                Glyphs("Cultivating", time: t) { g in
                    let wateredAt = 0.05 + g.progress * 0.7
                    let grown = Motion.window(beat, wateredAt, wateredAt + 0.12, 0.9, 1)
                    let drop = Motion.ramp(beat, wateredAt - 0.08, wateredAt)
                    g.text
                        .foregroundStyle(Color(red: 0.55, green: 0.5, blue: 0.3).mix(.green, grown))
                        .scaleEffect(x: 1, y: 0.8 + 0.3 * grown, anchor: .bottom)
                        .rotationEffect(.degrees(g.wave(0.5, lag: 0.08) * 5), anchor: .bottom)
                        .overlay(alignment: .top) {
                            Image(systemName: "drop.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(.cyan)
                                .offset(y: -20 + drop * 16)
                                .opacity(drop > 0 && drop < 1 ? 1 : 0)
                        }
                }
                Capsule()
                    .fill(Color(red: 0.45, green: 0.32, blue: 0.2))
                    .frame(width: 180, height: 3)
            }
        }
    }
}

#Preview {
    Cultivating()
}
