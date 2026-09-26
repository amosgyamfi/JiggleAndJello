//
//  Computing.swift
//  AgenThinking
//  Meaning: Executing instructions, one operation at a time.
//  Use case: When an agent runs code, a query, or a deterministic tool.
//  Motion: A braille spinner turns while a register cursor steps across monospaced letters, inverting each one it processes.
//

import SwiftUI

struct Computing: View {
    private let spinner = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]

    var body: some View {
        Clock { t in
            let word = "Computing"
            let cursor = Int(t * 9) % (word.count + 5)
            HStack(spacing: 8) {
                Text(spinner[Int(t * 12) % spinner.count])
                    .foregroundStyle(.cyan)
                Glyphs(word, time: t) { g in
                    let active = g.index == cursor
                    let done = g.index < cursor
                    g.text
                        .foregroundStyle(active ? Color.black : done ? .cyan : Color(white: 0.45))
                        .padding(.horizontal, 1)
                        .background(active ? Color.cyan : .clear, in: .rect(cornerRadius: 3))
                }
            }
            .fontDesign(.monospaced)
        }
    }
}

#Preview {
    Computing()
}
