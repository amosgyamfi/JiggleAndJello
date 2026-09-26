//
//  Composing.swift
//  AgenThinking
//  Meaning: Arranging parts into a harmonious piece, like writing music.
//  Use case: When an agent drafts a document, email, or long-form answer.
//  Motion: Letters step between the lines of a music staff like a melody, each hop landing on a new pitch.
//

import SwiftUI

struct Composing: View {
    private let beat = 0.5

    var body: some View {
        Clock { t in
            let bar = Int(t / beat)
            let within = Motion.smooth(Motion.phase(t, beat) / 0.6)
            ZStack {
                VStack(spacing: 7) {
                    ForEach(0..<5, id: \.self) { _ in
                        Rectangle().fill(.white.opacity(0.12)).frame(width: 220, height: 1)
                    }
                }

                HStack(spacing: 6) {
                    Image(systemName: "music.note")
                        .foregroundStyle(.yellow)
                        .rotationEffect(.degrees(sin(t * 4) * 10))
                    Glyphs("Composing", time: t) { g in
                        let from = pitch(g.index, bar)
                        let to = pitch(g.index, bar + 1)
                        let y = from + (to - from) * within
                        g.text
                            .foregroundStyle(Color(hue: 0.12 + (y + 16) / 32 * 0.5, saturation: 0.55, brightness: 1))
                            .offset(y: y)
                    }
                }
            }
        }
    }

    private func pitch(_ index: Int, _ bar: Int) -> Double {
        (floor(Motion.random(index, bar) * 5) - 2) * 8
    }
}

#Preview {
    Composing()
}
