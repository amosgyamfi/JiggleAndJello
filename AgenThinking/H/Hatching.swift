//
//  Hatching.swift
//  AgenThinking
//  Meaning: Emerging from a shell; a plan finally coming out.
//  Use case: The moment an agent's long-incubated result is ready to reveal.
//  Motion: An egg rocks harder and harder, cracks into two halves, and the letters pop out with a springy bounce.
//

import SwiftUI

struct Hatching: View {
    private let period = 3.8
    private let shell = Color(red: 1, green: 0.96, blue: 0.86)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period)
            let wobble = Motion.ramp(beat, 0, 0.45) * (beat < 0.45 ? 1 : 0)
            let crack = Motion.window(beat, 0.45, 0.55, 0.9, 1)
            let pop = beat > 0.48 ? Motion.spring(Motion.ramp(beat, 0.48, 0.8)) : 0
            ZStack {
                Glyphs("Hatching", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(Color.yellow)
                        .scaleEffect(0.7 + 0.3 * crack + 0.25 * pop * crack)
                        .offset(y: -6 * pop * crack)
                        .opacity(0.25 + 0.75 * crack)
                }
                eggHalf(top: true)
                    .offset(y: -14 * crack)
                    .rotationEffect(.degrees(-14 * crack))
                eggHalf(top: false)
                    .offset(y: 8 * crack)
            }
            .rotationEffect(.degrees(sin(t * 14) * 9 * wobble), anchor: .bottom)
        }
    }

    private func eggHalf(top: Bool) -> some View {
        Capsule()
            .stroke(shell, lineWidth: 2)
            .frame(width: 150, height: 46)
            .mask(alignment: top ? .top : .bottom) {
                Rectangle().frame(height: 23)
            }
            .frame(width: 150, height: 46)
    }
}

#Preview {
    Hatching()
}
