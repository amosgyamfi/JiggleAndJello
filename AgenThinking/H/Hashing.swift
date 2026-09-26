//
//  Hashing.swift
//  AgenThinking
//  Meaning: Turning input into a fixed fingerprint; also, hashing things out.
//  Use case: When an agent checksums files, dedupes content, or debates details.
//  Motion: Monospaced letters churn through colored hex digits in hard steps, briefly revealing the plain word between rounds.
//

import SwiftUI

struct Hashing: View {
    private let hex = Array("0123456789abcdef").map(String.init)
    private let period = 2.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let reveal = beat > 0.62
            let tick = Int(t * 7)
            HStack(spacing: 4) {
                Text("#")
                    .foregroundStyle(.gray)
                Glyphs("Hashing", time: t) { g in
                    let digest = Motion.random(g.index, tick)
                    Text(reveal ? g.character : hex[Int(digest * 16) % 16])
                        .foregroundStyle(reveal ? .white : Color(hue: digest, saturation: 0.6, brightness: 1))
                        .frame(width: 15)
                }
            }
            .fontDesign(.monospaced)
        }
    }
}

#Preview {
    Hashing()
}
