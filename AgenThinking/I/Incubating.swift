//
//  Incubating.swift
//  AgenThinking
//  Meaning: Keeping something warm and safe while it develops.
//  Use case: When an agent lets a long-running job mature, like training or indexing.
//  Motion: Letters beat with a gentle lub-dub heartbeat inside a warm, glowing dome of light.
//

import SwiftUI

struct Incubating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 1.3)
            let heart = Motion.bell((beat - 0.1) / 0.06) + 0.6 * Motion.bell((beat - 0.28) / 0.06)
            ZStack {
                Ellipse()
                    .fill(RadialGradient(colors: [.orange.opacity(0.35), .clear], center: .center, startRadius: 0, endRadius: 110))
                    .frame(width: 240, height: 90)
                    .scaleEffect(1 + 0.08 * heart)

                Glyphs("Incubating", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 1, green: 0.85, blue: 0.65).mix(.orange, 0.5 * heart))
                        .scaleEffect(1 + 0.1 * heart * (1 - 0.5 * abs(g.centered)))
                }
            }
        }
    }
}

#Preview {
    Incubating()
}
