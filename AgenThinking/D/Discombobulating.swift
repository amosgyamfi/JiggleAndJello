//
//  Discombobulating.swift
//  AgenThinking
//  Meaning: Thrown into total disarray.
//  Use case: When an agent hits conflicting instructions or a messy state it must untangle.
//  Motion: Orderly letters explode into chaos: tumbling in 3-D, scattering, and hue-shifting wildly before briefly regrouping.
//

import SwiftUI

struct Discombobulating: View {
    var body: some View {
        Clock { t in
            let chaos = Motion.window(Motion.phase(t, 4), 0.15, 0.35, 0.8, 0.95)
            Glyphs("Discombobulating", time: t) { g in
                g.text
                    .foregroundStyle(Color.pink)
                    .hueRotation(.degrees(chaos * g.noise(1.5, salt: 1) * 180))
                    .rotation3DEffect(
                        .degrees(chaos * g.noise(1.2, salt: 2) * 200),
                        axis: (x: g.random(3), y: g.random(4), z: g.random(5) - 0.5)
                    )
                    .offset(x: chaos * g.noise(2, salt: 6) * 12, y: chaos * g.noise(2.3, salt: 7) * 22)
                    .scaleEffect(1 + chaos * g.noise(1.8, salt: 8) * 0.4)
            }
        }
    }
}

#Preview {
    Discombobulating()
}
