//
//  Blanching.swift
//  AgenThinking
//  Meaning: A quick dip that strips color, like vegetables plunged into boiling water.
//  Use case: When an agent normalizes, sanitizes, or strips formatting from data.
//  Motion: Vivid green letters dunk one by one below a waterline and come up pale, then slowly regain color.
//

import SwiftUI

struct Blanching: View {
    var body: some View {
        Clock { t in
            VStack(spacing: 2) {
                Glyphs("Blanching", time: t) { g in
                    let local = g.phase(3.2, lag: -0.12)
                    let dunk = Motion.window(local, 0, 0.08, 0.16, 0.26)
                    let pale = Motion.window(local, 0.12, 0.22, 0.6, 1)
                    g.text
                        .foregroundStyle(Color.green.mix(.white, 0.8 * pale))
                        .saturation(1 - 0.7 * pale)
                        .offset(y: 16 * dunk)
                        .opacity(1 - 0.5 * dunk)
                }
                Rectangle()
                    .fill(LinearGradient(colors: [.clear, .cyan.opacity(0.5), .clear], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 200, height: 1.5)
                    .offset(y: -6)
            }
        }
    }
}

#Preview {
    Blanching()
}
