//
//  Razzmatazzing.swift
//  AgenThinking
//  Meaning: Flashy, showbiz-style razzmatazz.
//  Use case: When an agent announces a launch, release, or headline result.
//  Motion: Theater-marquee bulbs chase around the word while the letters flash alternately like a Broadway sign.
//

import SwiftUI

struct Razzmatazzing: View {
    private let bulbs = 17

    var body: some View {
        Clock { t in
            let step = Int(t * 8)
            VStack(spacing: 6) {
                bulbRow(step: step, reversed: false)
                Glyphs("Razzmatazzing", time: t) { g in
                    let on = (g.index + Int(t * 3)).isMultiple(of: 2)
                    g.text
                        .foregroundStyle(on ? Color(red: 1, green: 0.85, blue: 0.4) : Color(red: 0.9, green: 0.25, blue: 0.3))
                        .shadow(color: .yellow.opacity(on ? 0.8 : 0), radius: 6)
                }
                .fontWeight(.heavy)
                bulbRow(step: step, reversed: true)
            }
        }
    }

    private func bulbRow(step: Int, reversed: Bool) -> some View {
        HStack(spacing: 7) {
            ForEach(0..<bulbs, id: \.self) { k in
                let lit = ((reversed ? bulbs - k : k) + step) % 3 == 0
                Circle()
                    .fill(lit ? Color.yellow : Color(white: 0.25))
                    .frame(width: 5, height: 5)
                    .shadow(color: .yellow.opacity(lit ? 1 : 0), radius: 4)
            }
        }
    }
}

#Preview {
    Razzmatazzing()
}
