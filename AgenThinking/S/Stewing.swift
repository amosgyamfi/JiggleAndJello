//
//  Stewing.swift
//  AgenThinking
//  Meaning: Cooking slowly for a long time; also, brooding over something.
//  Use case: When an agent keeps thinking about a hard problem for a long stretch.
//  Motion: Thick, dark letters roll slowly in a pot while the lid rattles periodically and puffs of steam escape.
//

import SwiftUI

struct Stewing: View {
    private let stew = Color(red: 0.75, green: 0.35, blue: 0.25)

    var body: some View {
        Clock { t in
            let since = Motion.phase(t, 2.4) * 2.4
            let rattle = since < 0.5 ? sin(since * 70) * (1 - since / 0.5) : 0
            let puff = Motion.ramp(since, 0.05, 0.9)
            ZStack {
                VStack(spacing: 1) {
                    Capsule().fill(Color(white: 0.7)).frame(width: 10, height: 4)
                    Capsule().fill(Color(white: 0.55)).frame(width: 150, height: 4)
                }
                .rotationEffect(.degrees(rattle * 3))
                .offset(y: -24 - abs(rattle) * 3)

                ForEach(0..<2, id: \.self) { k in
                    Circle()
                        .fill(.white.opacity(0.25 * (1 - puff)))
                        .frame(width: 10 + 16 * puff)
                        .blur(radius: 4)
                        .offset(x: (k == 0 ? -82 : 82) + (k == 0 ? -10 : 10) * puff, y: -26 - 16 * puff)
                }

                Glyphs("Stewing", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(stew.mix(Color(red: 0.95, green: 0.6, blue: 0.4), g.pulse(0.25, lag: 0.15)))
                        .rotationEffect(.degrees(g.wave(0.2, lag: 0.2) * 10))
                        .offset(y: g.wave(0.25, lag: 0.15) * 3 + 4)
                }
                .fontWeight(.heavy)
            }
        }
    }
}

#Preview {
    Stewing()
}
