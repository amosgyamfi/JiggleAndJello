//
//  Bootstrapping.swift
//  AgenThinking
//  Meaning: Starting up from nothing, loading itself step by step.
//  Use case: When an agent initializes tools, installs dependencies, or spins up an environment.
//  Motion: Terminal-green monospaced letters flicker on one by one behind a blinking block cursor, then report OK.
//

import SwiftUI

struct Bootstrapping: View {
    private let word = "Bootstrapping"
    private let period = 4.0
    private let terminal = Color(red: 0.3, green: 1, blue: 0.5)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, period) * period
            let typed = 0.3 + 2.4
            let blink = Motion.phase(t, 0.8) < 0.5
            HStack(spacing: 0) {
                Text("> ")
                    .foregroundStyle(terminal.opacity(0.6))
                Glyphs(word, time: t) { g in
                    let appear = 0.3 + g.progress * 2.4
                    let since = beat - appear
                    let flicker = since < 0.15 ? (Motion.random(g.index, Int(t * 30)) > 0.5 ? 1.0 : 0.2) : 1.0
                    g.text
                        .foregroundStyle(terminal)
                        .opacity(since < 0 ? 0 : flicker)
                        .overlay {
                            Rectangle()
                                .fill(terminal)
                                .opacity(since < 0 && since > -2.4 / Double(g.count) ? 1 : 0)
                        }
                }
                Text(beat > typed + 0.3 ? " ok" : "")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundStyle(terminal.opacity(0.7))
                Rectangle()
                    .fill(terminal)
                    .frame(width: 10, height: 22)
                    .opacity(beat > typed && blink ? 1 : 0)
            }
            .fontDesign(.monospaced)
            .glow(terminal.opacity(0.5), radius: 5)
        }
    }
}

#Preview {
    Bootstrapping()
}
