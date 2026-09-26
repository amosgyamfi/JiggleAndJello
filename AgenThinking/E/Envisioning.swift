//
//  Envisioning.swift
//  AgenThinking
//  Meaning: Picturing a future outcome in the mind's eye.
//  Use case: When an agent plans the target end state before acting.
//  Motion: An eye opens as letters rise from lying flat on a far horizon to standing upright in perspective.
//

import SwiftUI

struct Envisioning: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.8)
            let open = Motion.window(beat, 0, 0.12, 0.85, 0.95)
            HStack(spacing: 8) {
                Image(systemName: "eye")
                    .foregroundStyle(.cyan)
                    .scaleEffect(x: 1, y: 0.1 + 0.9 * open)
                Glyphs("Envisioning", time: t) { g in
                    let rise = Motion.window(beat, 0.1 + g.progress * 0.35, 0.3 + g.progress * 0.35, 0.85, 0.95)
                    g.text
                        .foregroundStyle(Color.cyan.mix(.white, rise))
                        .rotation3DEffect(.degrees((1 - rise) * 82), axis: (x: 1, y: 0, z: 0), anchor: .bottom, perspective: 0.8)
                        .scaleEffect(0.6 + 0.4 * rise)
                        .opacity(0.15 + 0.85 * rise)
                }
            }
        }
    }
}

#Preview {
    Envisioning()
}
