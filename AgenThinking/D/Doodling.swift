//
//  Doodling.swift
//  AgenThinking
//  Meaning: Sketching idly and freely.
//  Use case: When an agent explores loose ideas or rough prototypes.
//  Motion: Italic letters trace little hand-drawn loops while a pencil scribbles a squiggle underneath with a trimmed path.
//

import SwiftUI

struct Doodling: View {
    private let lineWidth = 150.0

    var body: some View {
        Clock { t in
            let draw = Motion.smooth(Motion.phase(t, 3) / 0.8)
            VStack(spacing: 4) {
                Glyphs("Doodling", time: t, spacing: 1) { g in
                    let speed = 0.6 + g.random() * 0.6
                    g.text
                        .italic()
                        .foregroundStyle(Color(hue: 0.55 + g.progress * 0.3, saturation: 0.35, brightness: 1))
                        .offset(x: cos(t * speed * 3 + g.i) * 1.6, y: sin(t * speed * 3 + g.i) * 2.4)
                        .rotationEffect(.degrees(sin(t * speed * 2 + g.i) * 6))
                }
                .fontDesign(.serif)

                ZStack(alignment: .leading) {
                    Squiggle()
                        .trim(from: 0, to: draw)
                        .stroke(.white.opacity(0.6), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                        .frame(width: lineWidth, height: 10)
                    Image(systemName: "pencil")
                        .font(.system(size: 14))
                        .foregroundStyle(.yellow)
                        .offset(x: draw * lineWidth - 2, y: Squiggle.y(draw) * 5 - 9)
                }
            }
        }
    }
}

private struct Squiggle: Shape {
    static func y(_ x: Double) -> Double { sin(x * 7 * .pi) }

    func path(in rect: CGRect) -> Path {
        Path { p in
            for step in 0...80 {
                let x = Double(step) / 80
                let point = CGPoint(x: rect.minX + x * rect.width, y: rect.midY + Squiggle.y(x) * rect.height / 2)
                step == 0 ? p.move(to: point) : p.addLine(to: point)
            }
        }
    }
}

#Preview {
    Doodling()
}
