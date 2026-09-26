//
//  Crafting.swift
//  AgenThinking
//  Meaning: Building something carefully by hand.
//  Use case: When an agent hand-writes code, a design, or a careful edit.
//  Motion: Wooden letter blocks tip up from flat to standing, one by one in 3-D, then fold away to be rebuilt.
//

import SwiftUI

struct Crafting: View {
    private let wood = Color(red: 0.62, green: 0.42, blue: 0.24)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.8)
            Glyphs("Crafting", time: t, spacing: 3) { g in
                let placed = Motion.window(beat, g.progress * 0.45, g.progress * 0.45 + 0.12, 0.85, 1)
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.9, blue: 0.75))
                    .frame(width: 20, height: 30)
                    .background(wood.opacity(0.55), in: .rect(cornerRadius: 4))
                    .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(wood, lineWidth: 1))
                    .rotation3DEffect(.degrees((1 - placed) * -90), axis: (x: 1, y: 0, z: 0), anchor: .bottom, perspective: 0.6)
                    .opacity(0.2 + 0.8 * placed)
            }
        }
    }
}

#Preview {
    Crafting()
}
