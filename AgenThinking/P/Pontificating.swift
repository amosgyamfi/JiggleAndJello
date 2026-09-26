//
//  Pontificating.swift
//  AgenThinking
//  Meaning: Speaking pompously, as if delivering a sermon.
//  Use case: When an agent writes a long explanation with strong opinions.
//  Motion: A wagging finger punctuates each syllable as it is stressed: huge, heavy, gold serif italics.
//

import SwiftUI

struct Pontificating: View {
    private let syllables = [0...2, 3...4, 5...6, 7...8, 9...12]
    private let beat = 0.55

    var body: some View {
        Clock { t in
            let stressed = Int(t / beat) % syllables.count
            let punch = 1 - Motion.smooth(Motion.phase(t, beat) / 0.9)
            HStack(spacing: 8) {
                Image(systemName: "hand.point.up.left.fill")
                    .foregroundStyle(Color(red: 1, green: 0.85, blue: 0.7))
                    .rotationEffect(.degrees(-20 * punch), anchor: .bottom)
                Glyphs("Pontificating", time: t) { g in
                    let stress = syllables[stressed].contains(g.index) ? punch : 0
                    g.text
                        .italic(stress > 0.3)
                        .fontWeight(stress > 0.3 ? .black : .semibold)
                        .foregroundStyle(Color(white: 0.55).mix(Color(red: 1, green: 0.8, blue: 0.35), stress))
                        .scaleEffect(1 + 0.35 * stress, anchor: .bottom)
                }
                .fontDesign(.serif)
            }
        }
    }
}

#Preview {
    Pontificating()
}
