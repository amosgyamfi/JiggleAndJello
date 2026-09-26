//
//  Drizzling.swift
//  AgenThinking
//  Meaning: A light, steady trickle.
//  Use case: When an agent streams results in gradually, a few at a time.
//  Motion: Raindrops fall onto individual letters at random moments; each hit makes a tiny splash and a small dip.
//

import SwiftUI

struct Drizzling: View {
    var body: some View {
        Clock { t in
            Glyphs("Drizzling", time: t) { g in
                let period = 1.6 + g.random() * 1.2
                let life = Motion.phase(t + g.random(1) * period, period)
                let fall = Motion.ramp(life, 0, 0.35)
                let dip = Motion.window(life, 0.35, 0.4, 0.45, 0.7)
                let splash = Motion.ramp(life, 0.35, 0.6)
                g.text
                    .foregroundStyle(Color(red: 0.7, green: 0.85, blue: 1).mix(.cyan, dip))
                    .offset(y: 3 * dip)
                    .overlay(alignment: .top) {
                        ZStack {
                            Capsule()
                                .fill(.cyan)
                                .frame(width: 2, height: 6)
                                .offset(y: -34 + fall * 30)
                                .opacity(fall < 1 ? 0.9 : 0)
                            Ellipse()
                                .stroke(.cyan.opacity(1 - splash), lineWidth: 1)
                                .frame(width: 4 + 14 * splash, height: 2 + 3 * splash)
                                .opacity(splash > 0 && splash < 1 ? 1 : 0)
                        }
                    }
            }
        }
    }
}

#Preview {
    Drizzling()
}
