//
//  Zigzagging.swift
//  AgenThinking
//  Meaning: Moving in a series of sharp alternating turns.
//  Use case: When an agent tries alternating strategies or backtracks.
//  Motion: Letters snap into a sharp zigzag of alternating heights and tilts that travels and flips direction, with a lightning-style path drawn behind.
//

import SwiftUI

struct Zigzagging: View {
    private let letterWidth = 12.5

    var body: some View {
        Clock { t in
            let flip = Motion.triangle(Motion.phase(t, 1.2)) * 2 - 1
            ZStack {
                Path { path in
                    for k in 0..<10 {
                        let point = CGPoint(x: (Double(k) + 0.5) * letterWidth, y: 12 + (k.isMultiple(of: 2) ? -1 : 1) * 6 * flip)
                        k == 0 ? path.move(to: point) : path.addLine(to: point)
                    }
                }
                .stroke(Color.yellow.opacity(0.25), style: StrokeStyle(lineWidth: 2, lineJoin: .miter))
                .frame(width: 10 * letterWidth, height: 24)

                Glyphs("Zigzagging", time: t) { g in
                    let side = g.isEven ? -1.0 : 1.0
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.9, blue: 0.4).mix(.orange, (side * flip + 1) / 2))
                        .offset(y: side * 6 * flip)
                        .rotationEffect(.degrees(side * 10 * flip))
                }
            }
        }
    }
}

#Preview {
    Zigzagging()
}
