//
//  Moseying.swift
//  AgenThinking
//  Meaning: Strolling along in a leisurely way.
//  Use case: When an agent is working at a relaxed pace on low-priority work.
//  Motion: The word strolls back and forth across the card with an easy gait, leaning gently into its direction of travel.
//

import SwiftUI

struct Moseying: View {
    var body: some View {
        Clock { t in
            let heading = cos(t * 0.45)
            Glyphs("Moseying", time: t, spacing: 1) { g in
                let gait = abs(sin(t * 2.2 + g.i * 0.9))
                g.text
                    .foregroundStyle(Color(red: 0.93, green: 0.78, blue: 0.58))
                    .offset(y: -3 * gait)
                    .rotationEffect(.degrees(heading * 6 + sin(t * 2.2 + g.i * 0.9) * 3), anchor: .bottom)
            }
            .offset(x: sin(t * 0.45) * 28)
        }
    }
}

#Preview {
    Moseying()
}
