//
//  Deciphering.swift
//  AgenThinking
//  Meaning: Decoding something cryptic into plain meaning.
//  Use case: When an agent reads unfamiliar code, error traces, or encoded data.
//  Motion: A magnifier slides across scrambled symbols; letters under the lens enlarge and stay decoded once it has passed.
//

import SwiftUI

struct Deciphering: View {
    private let word = "Deciphering"
    private let symbols = Array("#$%&@*?!§¥∆≈").map(String.init)
    private let period = 3.4
    private let width = 0.12

    var body: some View {
        Clock { t in
            let head = Motion.phase(t, period) * (1 + 4 * width) - 2 * width
            ZStack {
                Glyphs(word, time: t) { g in
                    let decoded = g.progress < head
                    let lens = Motion.bell((g.progress - head) / width)
                    let scramble = symbols[(g.index * 5 + Int(t * 8)) % symbols.count]
                    Text(decoded ? g.character : scramble)
                        .foregroundStyle(decoded ? Color.white : Color.orange.opacity(0.55))
                        .scaleEffect(1 + 0.35 * lens)
                        .frame(width: 15)
                }
                .fontDesign(.monospaced)

                Image(systemName: "magnifyingglass")
                    .font(.system(size: 30, weight: .light))
                    .foregroundStyle(.white.opacity(0.85))
                    .offset(x: (head - 0.5) * Double(word.count) * 15 + 8, y: 6)
            }
        }
    }
}

#Preview {
    Deciphering()
}
