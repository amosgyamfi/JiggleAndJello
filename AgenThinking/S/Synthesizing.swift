//
//  Synthesizing.swift
//  AgenThinking
//  Meaning: Combining separate elements into a new whole.
//  Use case: When an agent summarizes many sources into one answer.
//  Motion: Red and blue copies of the word converge from opposite corners and fuse with additive blending into a bright new word.
//

import SwiftUI

struct Synthesizing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.2)
            let fuse = Motion.window(beat, 0.05, 0.45, 0.8, 1)
            let apart = 1 - fuse
            ZStack {
                layer(t, color: Color(red: 1, green: 0.3, blue: 0.4))
                    .offset(x: -14 * apart, y: -10 * apart)
                    .rotationEffect(.degrees(-6 * apart))
                layer(t, color: Color(red: 0.3, green: 0.5, blue: 1))
                    .offset(x: 14 * apart, y: 10 * apart)
                    .rotationEffect(.degrees(6 * apart))
                layer(t, color: .white)
                    .opacity(fuse)
                    .glow(.purple, radius: 10 * fuse)
            }
            .blendMode(.plusLighter)
        }
    }

    private func layer(_ t: Double, color: Color) -> some View {
        Glyphs("Synthesizing", time: t) { g in
            g.text
                .foregroundStyle(color)
                .offset(y: g.wave(0.8, lag: 0.08) * 1.5)
        }
    }
}

#Preview {
    Synthesizing()
}
