//
//  Meandering.swift
//  AgenThinking
//  Meaning: Following a winding, unhurried path.
//  Use case: When an agent explores without a fixed route, following leads as they appear.
//  Motion: Letters drift along a slow, winding river curve, tilting with its bends above a flowing dashed path.
//

import SwiftUI

struct Meandering: View {
    private let amplitude = 7.0
    private let wavelength = 130.0
    private let letterWidth = 14.0

    var body: some View {
        Clock { t in
            let flow = t * 1.1
            VStack(spacing: 8) {
                Glyphs("Meandering", time: t) { g in
                    let x = g.i * letterWidth
                    let theta = x / wavelength * 2 * .pi - flow
                    let slope = amplitude * 2 * .pi / wavelength * cos(theta)
                    g.text
                        .foregroundStyle(Color.teal.mix(.white, (sin(theta) + 1) / 3))
                        .offset(y: amplitude * sin(theta))
                        .rotationEffect(.radians(atan(slope)))
                }
                RiverPath(phase: flow)
                    .stroke(.teal.opacity(0.5), style: StrokeStyle(lineWidth: 1.2, lineCap: .round, dash: [4, 5], dashPhase: -t * 12))
                    .frame(width: 160, height: 10)
            }
        }
    }
}

private struct RiverPath: Shape {
    var phase: Double

    func path(in rect: CGRect) -> Path {
        Path { p in
            for step in 0...60 {
                let x = Double(step) / 60
                let point = CGPoint(x: rect.minX + x * rect.width, y: rect.midY + sin(x * 2.5 * .pi - phase) * rect.height / 2)
                if step == 0 { p.move(to: point) } else { p.addLine(to: point) }
            }
        }
    }
}

#Preview {
    Meandering()
}
