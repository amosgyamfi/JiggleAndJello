//
//  Precipitating.swift
//  AgenThinking
//  Meaning: Falling out of solution; something condensing into solid form.
//  Use case: When an agent's scattered findings suddenly condense into a concrete answer.
//  Motion: Letters fall as stretched droplets in random order and splash into solid shape with a ripple at the baseline.
//

import SwiftUI

struct Precipitating: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.8)
            Glyphs("Precipitating", time: t) { g in
                let dropAt = 0.05 + g.random(g.cycle(3.8)) * 0.45
                let fall = Motion.ramp(beat, dropAt, dropAt + 0.1)
                let falling = fall > 0 && fall < 1
                let splash = Motion.ramp(beat, dropAt + 0.1, dropAt + 0.25)
                let settle = fall >= 1 ? Motion.spring(splash) : 0
                g.text
                    .foregroundStyle(falling ? Color.cyan : Color(red: 0.8, green: 0.92, blue: 1))
                    .scaleEffect(x: falling ? 0.55 : 1 + 0.25 * settle, y: falling ? 1.5 : 1 - 0.25 * settle, anchor: .bottom)
                    .offset(y: (1 - fall) * -42)
                    .opacity(fall > 0 ? 1 - Motion.ramp(beat, 0.9, 1) : 0)
                    .overlay(alignment: .bottom) {
                        Ellipse()
                            .stroke(.cyan.opacity(splash > 0 && splash < 1 ? 1 - splash : 0), lineWidth: 1)
                            .frame(width: 6 + 18 * splash, height: 2 + 4 * splash)
                            .offset(y: 2)
                    }
            }
        }
    }
}

#Preview {
    Precipitating()
}
