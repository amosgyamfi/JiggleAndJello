//
//  Garnishing.swift
//  AgenThinking
//  Meaning: Adding a small finishing touch on top.
//  Use case: When an agent adds a final note, citation, or link to its answer.
//  Motion: One by one, a sprig of herb springs onto each letter with a twist, and the letter bows under it.
//

import SwiftUI

struct Garnishing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            Glyphs("Garnishing", time: t, spacing: 1) { g in
                let landAt = 0.05 + g.progress * 0.55
                let placed = Motion.window(beat, landAt, landAt + 0.06, 0.88, 0.98)
                let bounce = beat > landAt ? Motion.spring(Motion.ramp(beat, landAt, landAt + 0.25)) : 0
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.95, blue: 0.85))
                    .offset(y: 2 * bounce * placed)
                    .overlay(alignment: .top) {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 9))
                            .foregroundStyle(.green)
                            .rotationEffect(.degrees(-40 + 40 * placed + 20 * bounce))
                            .scaleEffect(placed * (1 + 0.4 * bounce))
                            .offset(y: -8 - 10 * (1 - placed))
                    }
            }
        }
    }
}

#Preview {
    Garnishing()
}
