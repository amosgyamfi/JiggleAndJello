//
//  Noodling.swift
//  AgenThinking
//  Meaning: Casually playing around with an idea.
//  Use case: When an agent tries informal experiments before committing to an approach.
//  Motion: Pasta-yellow letters stretch and wiggle elastically along a wobbling noodle strand.
//

import SwiftUI

struct Noodling: View {
    private let pasta = Color(red: 1, green: 0.88, blue: 0.5)

    var body: some View {
        Clock { t in
            ZStack {
                Strand(phase: t * 2.5)
                    .stroke(pasta.opacity(0.35), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 150, height: 10)

                Glyphs("Noodling", time: t, spacing: 1) { g in
                    let wiggle = sin(t * 3 - g.i * 0.6)
                    g.text
                        .foregroundStyle(pasta)
                        .scaleEffect(x: 1 + 0.25 * wiggle, y: 1 - 0.1 * wiggle)
                        .offset(y: sin(t * 2.5 - g.i * 0.5) * 3)
                        .rotationEffect(.degrees(cos(t * 2.5 - g.i * 0.5) * 7))
                }
            }
        }
    }
}

private struct Strand: Shape {
    var phase: Double

    func path(in rect: CGRect) -> Path {
        Path { p in
            for step in 0...50 {
                let x = Double(step) / 50
                let point = CGPoint(x: rect.minX + x * rect.width, y: rect.midY + sin(x * 5 * .pi - phase) * rect.height / 2)
                if step == 0 { p.move(to: point) } else { p.addLine(to: point) }
            }
        }
    }
}

#Preview {
    Noodling()
}
