//
//  Crunching.swift
//  AgenThinking
//  Meaning: Chewing through lots of data, like number crunching.
//  Use case: When an agent processes a big dataset, index, or log dump.
//  Motion: Groups of three letters get bitten and squeezed flat one group at a time, spitting out crumbs.
//

import SwiftUI

struct Crunching: View {
    private let bite = 0.34

    var body: some View {
        Clock { t in
            let word = "Crunching"
            let groups = (word.count + 2) / 3
            let active = Int(t / bite) % groups
            let chew = 1 - Motion.smooth(Motion.phase(t, bite) / 0.8)
            Glyphs(word, time: t) { g in
                let crunch = g.index / 3 == active ? chew : 0
                g.text
                    .foregroundStyle(Color.white.mix(.yellow, crunch))
                    .scaleEffect(x: 1 - 0.45 * crunch, y: 1 + 0.15 * crunch)
                    .overlay(alignment: .top) {
                        ForEach(0..<2, id: \.self) { k in
                            Rectangle()
                                .fill(.yellow)
                                .frame(width: 2.5, height: 2.5)
                                .offset(x: (Double(k) - 0.5) * 12 * (1 - crunch), y: -6 - 10 * (1 - crunch))
                                .opacity(crunch > 0 ? crunch : 0)
                        }
                    }
            }
            .fontDesign(.monospaced)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    Crunching()
}
