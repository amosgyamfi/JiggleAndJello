//
//  Pondering.swift
//  AgenThinking
//  Meaning: Thinking something over quietly.
//  Use case: The classic "thinking…" state before an agent responds.
//  Motion: The word slowly nods in 3-D perspective while three thinking dots bounce one after another.
//

import SwiftUI

struct Pondering: View {
    var body: some View {
        Clock { t in
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Glyphs("Pondering", time: t) { g in
                    g.text.foregroundStyle(Color(red: 0.85, green: 0.82, blue: 0.95))
                }
                .rotation3DEffect(.degrees(sin(t * 1.1) * 18), axis: (x: 1, y: 0, z: 0), perspective: 0.6)

                HStack(spacing: 3) {
                    ForEach(0..<3, id: \.self) { k in
                        let bounce = max(0, sin((t * 1.4 - Double(k) * 0.18) * 2 * .pi))
                        Circle()
                            .fill(.white.opacity(0.5 + 0.5 * bounce))
                            .frame(width: 5, height: 5)
                            .offset(y: -5 * bounce)
                    }
                }
            }
        }
    }
}

#Preview {
    Pondering()
}
