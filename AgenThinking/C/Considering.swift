//
//  Considering.swift
//  AgenThinking
//  Meaning: Weighing options carefully before deciding.
//  Use case: When an agent compares alternative approaches or trade-offs.
//  Motion: The word tips like a balance beam on a pivot, and the letters on the lower side grow heavier.
//

import SwiftUI

struct Considering: View {
    var body: some View {
        Clock { t in
            let tilt = sin(t * 1.3)
            VStack(spacing: 2) {
                Glyphs("Considering", time: t) { g in
                    let weight = max(0, g.centered * tilt)
                    g.text
                        .foregroundStyle(Color.white.mix(.orange, weight))
                        .scaleEffect(1 + 0.12 * weight, anchor: .bottom)
                }
                .rotationEffect(.degrees(tilt * 7))

                Pivot()
                    .fill(.white.opacity(0.4))
                    .frame(width: 14, height: 9)
            }
        }
    }
}

private struct Pivot: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.closeSubpath()
        }
    }
}

#Preview {
    Considering()
}
