//
//  Sublimating.swift
//  AgenThinking
//  Meaning: Changing directly from solid to vapor, skipping the liquid stage.
//  Use case: When an agent skips an intermediate step, like going straight from spec to deploy.
//  Motion: Icy letters stay solid while ghostly vapor copies continuously peel off and rise from them like dry ice.
//

import SwiftUI

struct Sublimating: View {
    var body: some View {
        Clock { t in
            Glyphs("Sublimating", time: t) { g in
                ZStack {
                    ForEach(0..<2, id: \.self) { k in
                        let life = Motion.phase(t * 0.6 + g.random() + Double(k) * 0.5, 1)
                        g.text
                            .foregroundStyle(.white)
                            .blur(radius: 1 + 4 * life)
                            .scaleEffect(1 + 0.4 * life)
                            .offset(x: sin(life * 5 + g.i) * 3, y: -22 * life)
                            .opacity(0.5 * (1 - life))
                    }
                    g.text
                        .foregroundStyle(Color(red: 0.8, green: 0.92, blue: 1))
                        .shadow(color: .cyan.opacity(0.6), radius: 3)
                }
            }
        }
    }
}

#Preview {
    Sublimating()
}
