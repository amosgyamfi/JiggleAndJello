//
//  Perusing.swift
//  AgenThinking
//  Meaning: Reading something carefully and thoroughly.
//  Use case: When an agent reads files, docs, or search results in detail.
//  Motion: A highlighter marker slowly strokes under the letters as they are read, each one leaning in as the eye passes.
//

import SwiftUI

struct Perusing: View {
    private let period = 4.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let read = min(max((beat - 0.05) / 0.7, 0), 1)
            let clear = 1 - Motion.ramp(beat, 0.85, 1)
            HStack(spacing: 8) {
                Image(systemName: "book.pages.fill")
                    .foregroundStyle(.yellow.opacity(0.8))
                Glyphs("Perusing", time: t, spacing: 1) { g in
                    let highlighted = Motion.ramp(read * Double(g.count) - g.i, 0, 1)
                    let reading = Motion.bell((read * Double(g.count) - g.i - 0.5) / 0.8)
                    g.text
                        .foregroundStyle(Color.white.mix(.yellow, 0.3 * reading))
                        .scaleEffect(1 + 0.12 * reading)
                        .background(alignment: .bottom) {
                            Rectangle()
                                .fill(.yellow.opacity(0.35))
                                .frame(height: 12)
                                .scaleEffect(x: highlighted * clear, anchor: .leading)
                        }
                }
            }
        }
    }
}

#Preview {
    Perusing()
}
