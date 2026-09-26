//
//  Burrowing.swift
//  AgenThinking
//  Meaning: Digging deep beneath the surface.
//  Use case: When an agent searches deep in a codebase, logs, or nested data.
//  Motion: Letters tunnel below a ground line one after another, kicking up dirt, then pop back up.
//

import SwiftUI

struct Burrowing: View {
    private let soil = Color(red: 0.72, green: 0.52, blue: 0.34)

    var body: some View {
        Clock { t in
            VStack(spacing: 0) {
                Glyphs("Burrowing", time: t, spacing: 1) { g in
                    let local = g.phase(2.6, lag: -0.14)
                    let depth = Motion.window(local, 0, 0.18, 0.4, 0.55)
                    let digging = Motion.window(local, 0, 0.05, 0.15, 0.25)
                    g.text
                        .foregroundStyle(soil.mix(.white, 0.35))
                        .rotationEffect(.degrees(depth * 25))
                        .offset(y: 30 * depth)
                        .clipped()
                        .overlay(alignment: .bottom) {
                            ForEach(0..<3, id: \.self) { k in
                                Circle()
                                    .fill(soil)
                                    .frame(width: 3, height: 3)
                                    .offset(x: Double(k - 1) * 5 * digging, y: -10 * Motion.hop(digging) - 2)
                                    .opacity(digging)
                            }
                        }
                }
                Capsule()
                    .fill(soil)
                    .frame(width: 180, height: 2)
            }
        }
    }
}

#Preview {
    Burrowing()
}
