//
//  Wrangling.swift
//  AgenThinking
//  Meaning: Rounding up livestock; also, handling something unruly.
//  Use case: When an agent herds messy data, flaky tests, or many subagents.
//  Motion: Letters stray up and down out of line, then a lasso rope snaps taut and yanks them back into a springy row.
//

import SwiftUI

struct Wrangling: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3)
            let stray = Motion.smooth(Motion.ramp(beat, 0, 0.55))
            let yank = beat > 0.55 ? Motion.spring(Motion.ramp(beat, 0.55, 1), bounces: 3) : stray
            VStack(spacing: 2) {
                Glyphs("Wrangling", time: t, spacing: 1) { g in
                    let wild = (g.random(Int(t / 3)) * 2 - 1)
                    g.text
                        .foregroundStyle(Color(red: 0.95, green: 0.8, blue: 0.6))
                        .offset(y: wild * 14 * yank)
                        .rotationEffect(.degrees(wild * 25 * yank))
                }
                Path { path in
                    for x in stride(from: 0.0, through: 170, by: 4) {
                        let point = CGPoint(x: x, y: 7 + sin(x / 170 * 3 * .pi) * 5 * yank)
                        x == 0 ? path.move(to: point) : path.addLine(to: point)
                    }
                }
                .stroke(Color(red: 0.75, green: 0.55, blue: 0.3), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .frame(width: 170, height: 14)
            }
        }
    }
}

#Preview {
    Wrangling()
}
