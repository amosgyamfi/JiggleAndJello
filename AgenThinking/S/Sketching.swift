//
//  Sketching.swift
//  AgenThinking
//  Meaning: Drawing a quick, rough outline.
//  Use case: When an agent drafts a rough plan, wireframe, or outline first.
//  Motion: A pencil moves across revealing wobbly graphite strokes through a mask, then color washes in behind it.
//

import SwiftUI

struct Sketching: View {
    private let span = 150.0

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            let drawn = Motion.ramp(beat, 0.05, 0.6)
            let colored = Motion.ramp(beat, 0.55, 0.8)
            let erase = Motion.ramp(beat, 0.9, 1)
            ZStack {
                ZStack {
                    Glyphs("Sketching", time: t, spacing: 1) { g in
                        g.text
                            .foregroundStyle(Color(white: 0.6))
                            .offset(x: sin(g.i * 3 + floor(t * 6)) * 0.8, y: cos(g.i * 5 + floor(t * 6)) * 0.8)
                    }
                    Glyphs("Sketching", time: t, spacing: 1) { g in
                        g.text.foregroundStyle(Color(red: 1, green: 0.6, blue: 0.5))
                    }
                    .opacity(colored)
                }
                .mask(alignment: .leading) {
                    Rectangle().frame(width: span * drawn + 10)
                }
                .frame(width: span)
                .opacity(1 - erase)

                Image(systemName: "pencil")
                    .font(.system(size: 16))
                    .foregroundStyle(.yellow)
                    .rotationEffect(.degrees(sin(t * 20) * 6))
                    .offset(x: -span / 2 + span * drawn + 6, y: -6 + sin(t * 25) * 3)
                    .opacity(drawn < 1 ? 1 : 0)
            }
        }
    }
}

#Preview {
    Sketching()
}
