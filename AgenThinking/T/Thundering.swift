//
//  Thundering.swift
//  AgenThinking
//  Meaning: Making a loud, deep rumbling noise, like a storm.
//  Use case: When an agent runs a heavy, powerful operation.
//  Motion: A lightning bolt strikes with a double white flash, then the letters rumble and shake as the thunder rolls through.
//

import SwiftUI

struct Thundering: View {
    private let period = 3.0

    var body: some View {
        Clock { t in
            let since = Motion.phase(t, period) * period
            let flash = max(Motion.bell((since - 0.05) / 0.05), 0.7 * Motion.bell((since - 0.22) / 0.05))
            let rumble = Motion.ramp(since, 0.25, 0.4) * (1 - Motion.ramp(since, 0.4, 1.6))
            ZStack {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.yellow)
                    .glow(.yellow, radius: 10)
                    .opacity(flash)
                    .offset(x: 70, y: -26)

                Glyphs("Thundering", time: t) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.55, green: 0.6, blue: 0.75).mix(.white, flash))
                        .offset(x: g.noise(22) * 3 * rumble, y: g.noise(26, salt: 5) * 3 * rumble)
                        .rotationEffect(.degrees(g.noise(18, salt: 9) * 6 * rumble))
                }
                .shadow(color: .white.opacity(flash), radius: 12 * flash)
            }
        }
    }
}

#Preview {
    Thundering()
}
