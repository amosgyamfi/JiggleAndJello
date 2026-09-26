//
//  Determining.swift
//  AgenThinking
//  Meaning: Narrowing down to a firm conclusion.
//  Use case: When an agent picks the final answer, root cause, or next action.
//  Motion: A scope sweeps across blurry letters sharpening each in turn, then everything locks with a stamp and turns green.
//

import SwiftUI

struct Determining: View {
    private let period = 3.6

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let lock = Motion.window(beat, 0.62, 0.66, 0.92, 1)
            let stamp = beat > 0.62 ? Motion.spring((beat - 0.62) / 0.3) : 0
            HStack(spacing: 8) {
                Image(systemName: "scope")
                    .foregroundStyle(Color.white.mix(.green, lock))
                    .rotationEffect(.degrees(lock > 0 ? 0 : t * 220))
                Glyphs("Determining", time: t) { g in
                    let scan = beat < 0.62 ? Motion.bell((g.progress - beat / 0.55) / 0.12) : 0
                    let sharp = max(scan, lock)
                    g.text
                        .foregroundStyle(Color.gray.mix(.white, scan).mix(.green, lock))
                        .blur(radius: (1 - sharp) * 2.5)
                        .scaleEffect(1 + 0.15 * scan)
                }
                .scaleEffect(1 + 0.12 * stamp)
            }
        }
    }
}

#Preview {
    Determining()
}
