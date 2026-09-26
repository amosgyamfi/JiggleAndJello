//
//  Puttering.swift
//  AgenThinking
//  Meaning: Pottering about doing small, unhurried chores.
//  Use case: When an agent does light housekeeping: tidying imports, small fixes.
//  Motion: Only one letter at a time bothers to move: it lifts, turns a little, looks around, and settles back down.
//

import SwiftUI

struct Puttering: View {
    private let chore = 1.3

    var body: some View {
        Clock { t in
            let round = Int(t / chore)
            let word = "Puttering"
            let busy = Int(Motion.random(round, 11) * Double(word.count))
            let task = Motion.phase(t, chore)
            Glyphs(word, time: t, spacing: 1) { g in
                let active = g.index == busy
                let lift = active ? Motion.window(task, 0, 0.25, 0.7, 0.95) : 0
                let look = active ? sin(task * 2 * .pi * 2) : 0
                g.text
                    .foregroundStyle(Color(red: 0.7, green: 0.85, blue: 0.65).mix(.white, lift))
                    .offset(y: -8 * lift)
                    .rotationEffect(.degrees(12 * look * lift))
            }
        }
    }
}

#Preview {
    Puttering()
}
