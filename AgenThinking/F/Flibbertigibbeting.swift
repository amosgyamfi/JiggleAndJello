//
//  Flibbertigibbeting.swift
//  AgenThinking
//  Meaning: Chattering in a flighty, scatterbrained way.
//  Use case: When an agent streams lots of quick, lightweight updates.
//  Motion: Letters chatter with rapid, random hops and mouth-like squishes, flickering through pastel colors.
//

import SwiftUI

struct Flibbertigibbeting: View {
    var body: some View {
        Clock { t in
            Glyphs("Flibbertigibbeting", time: t) { g in
                let period = 0.35 + g.random() * 0.35
                let local = Motion.phase(t + g.random(1), period)
                let hop = Motion.hop(min(local / 0.6, 1))
                let chat = g.cycle(period) + Int(g.random(2) * 10)
                g.text
                    .foregroundStyle(Color(hue: Motion.random(g.index, chat), saturation: 0.45, brightness: 1))
                    .scaleEffect(x: 1 + 0.1 * hop, y: 1 - 0.2 * sin(local * 4 * .pi) * hop)
                    .rotationEffect(.degrees((g.random(3) - 0.5) * 20 * hop))
                    .offset(y: -8 * hop)
            }
        }
    }
}

#Preview {
    Flibbertigibbeting()
}
