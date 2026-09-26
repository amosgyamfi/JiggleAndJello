//
//  Architecting.swift
//  AgenThinking
//  Meaning: Designing the structure of a solution before building it.
//  Use case: When an agent plans a system, file layout, or multi-step approach.
//  Motion: On a tilted blueprint grid, letters are raised floor by floor from the baseline, each drawn in with a scan line.
//

import SwiftUI

struct Architecting: View {
    private let word = "Architecting"
    private let period = 3.4

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            ZStack {
                BlueprintGrid()
                    .frame(width: 250, height: 64)

                Glyphs(word, time: t) { g in
                    let built = Motion.window(beat, g.progress * 0.5, g.progress * 0.5 + 0.18, 0.88, 1)
                    g.text
                        .foregroundStyle(Color.cyan.mix(.white, built))
                        .scaleEffect(x: 1, y: built, anchor: .bottom)
                        .overlay(alignment: .top) {
                            Rectangle()
                                .fill(.cyan)
                                .frame(height: 1)
                                .offset(y: (1 - built) * 28)
                                .opacity(built > 0.02 && built < 0.98 ? 1 : 0)
                        }
                }
            }
            .rotation3DEffect(.degrees(28), axis: (x: 1, y: 0, z: 0), perspective: 0.5)
        }
    }
}

private struct BlueprintGrid: View {
    var body: some View {
        Canvas { context, size in
            var grid = Path()
            for x in stride(from: 0, through: size.width, by: 12) {
                grid.move(to: CGPoint(x: x, y: 0))
                grid.addLine(to: CGPoint(x: x, y: size.height))
            }
            for y in stride(from: 0, through: size.height, by: 12) {
                grid.move(to: CGPoint(x: 0, y: y))
                grid.addLine(to: CGPoint(x: size.width, y: y))
            }
            context.stroke(grid, with: .color(.cyan.opacity(0.14)), lineWidth: 0.5)
        }
    }
}

#Preview {
    Architecting()
}
