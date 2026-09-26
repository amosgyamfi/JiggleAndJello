//
//  Ruminating.swift
//  AgenThinking
//  Meaning: Chewing something over again and again.
//  Use case: When an agent re-examines the same material in repeated passes.
//  Motion: A soft highlight passes forward and back across the word endlessly, each letter it touches chewing twice.
//

import SwiftUI

struct Ruminating: View {
    var body: some View {
        Clock { t in
            let head = (Motion.triangle(Motion.phase(t, 3.2)) + 1) / 2
            Glyphs("Ruminating", time: t) { g in
                let near = Motion.bell((g.progress - head) / 0.12)
                let chew = abs(sin(t * 4 * .pi)) * near
                g.text
                    .foregroundStyle(Color(red: 0.7, green: 0.8, blue: 0.6).mix(.white, near))
                    .scaleEffect(x: 1 + 0.12 * chew, y: 1 - 0.18 * chew, anchor: .bottom)
            }
        }
    }
}

#Preview {
    Ruminating()
}
