//
//  Kneading.swift
//  AgenThinking
//  Meaning: Working something over and over with pressure until it's right.
//  Use case: When an agent repeatedly refines a draft through edit cycles.
//  Motion: Dough-colored letters get pressed flat and wide, then folded tall and narrow, in a rolling wave.
//

import SwiftUI

struct Kneading: View {
    var body: some View {
        Clock { t in
            let press = sin(t * 2 * .pi / 1.4)
            HStack(spacing: 8) {
                Image(systemName: "hand.raised.fill")
                    .foregroundStyle(Color(red: 1, green: 0.8, blue: 0.65))
                    .rotationEffect(.degrees(-90))
                    .offset(y: -5 * max(0, press))
                Glyphs("Kneading", time: t, spacing: 1) { g in
                    let squeeze = sin(t * 2 * .pi / 1.4 - g.i * 0.35)
                    g.text
                        .foregroundStyle(Color(red: 0.98, green: 0.88, blue: 0.7))
                        .scaleEffect(x: 1 + 0.22 * squeeze, y: 1 - 0.22 * squeeze, anchor: .bottom)
                }
            }
        }
    }
}

#Preview {
    Kneading()
}
