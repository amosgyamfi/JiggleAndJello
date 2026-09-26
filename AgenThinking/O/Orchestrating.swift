//
//  Orchestrating.swift
//  AgenThinking
//  Meaning: Directing many parts to work together as one.
//  Use case: When a lead agent coordinates several sub-agents or services.
//  Motion: A conductor's baton swings to cue three colored sections of letters in turn; each rises and swells on its cue.
//

import SwiftUI

struct Orchestrating: View {
    private let sections: [Color] = [.pink, .yellow, .cyan]
    private let cueLength = 0.8

    var body: some View {
        Clock { t in
            let cue = Int(t / cueLength) % sections.count
            let swell = sin(Motion.phase(t, cueLength) * .pi)
            HStack(alignment: .bottom, spacing: 10) {
                Capsule()
                    .fill(.white)
                    .frame(width: 2, height: 26)
                    .rotationEffect(.degrees(Double(cue - 1) * 35 + sin(t * 8) * 4), anchor: .bottom)

                Glyphs("Orchestrating", time: t) { g in
                    let section = min(g.index * sections.count / g.count, sections.count - 1)
                    let cued = section == cue ? swell : 0
                    g.text
                        .foregroundStyle(sections[section].mix(.white, 0.5 - 0.5 * cued))
                        .offset(y: -7 * cued + sin(t * 6 + g.i) * 1.5 * cued)
                        .scaleEffect(1 + 0.15 * cued)
                        .opacity(0.55 + 0.45 * max(cued, 0.3))
                }
            }
        }
    }
}

#Preview {
    Orchestrating()
}
