//
//  SockHopping.swift
//  AgenThinking
//  Meaning: A lighthearted 1950s dance in socks.
//  Use case: A cheerful, retro-styled state for playful agents.
//  Motion: Pastel letters hop in pairs while shuffling side to side over a checkered diner floor.
//

import SwiftUI

struct SockHopping: View {
    private let pastels: [Color] = [
        Color(red: 1, green: 0.7, blue: 0.8),
        Color(red: 0.6, green: 0.95, blue: 0.85),
        Color(red: 1, green: 0.95, blue: 0.6),
    ]

    var body: some View {
        Clock { t in
            let shuffle = sin(t * 2 * .pi / 1.2)
            VStack(spacing: 6) {
                Glyphs("Sock-hopping", time: t) { g in
                    let pairBeat = (g.index / 2).isMultiple(of: 2) ? 0.0 : 0.5
                    let hop = max(0, sin((t / 0.6 + pairBeat) * 2 * .pi))
                    g.text
                        .foregroundStyle(pastels[(g.index / 2) % pastels.count])
                        .offset(x: shuffle * 3, y: -8 * hop)
                        .rotationEffect(.degrees(shuffle * 6))
                }
                HStack(spacing: 0) {
                    ForEach(0..<16, id: \.self) { k in
                        Rectangle()
                            .fill(k.isMultiple(of: 2) ? Color.white.opacity(0.5) : Color.black)
                            .frame(width: 10, height: 5)
                    }
                }
                .clipShape(.rect(cornerRadius: 1))
            }
        }
    }
}

#Preview {
    SockHopping()
}
