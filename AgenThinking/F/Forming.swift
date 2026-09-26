//
//  Forming.swift
//  AgenThinking
//  Meaning: Taking shape from simple beginnings.
//  Use case: When an agent's answer or artifact is starting to take shape.
//  Motion: A row of dots swells and morphs into letters one by one, holds, then melts back into dots.
//

import SwiftUI

struct Forming: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            Glyphs("Forming", time: t, spacing: 2) { g in
                let shaped = Motion.window(beat, 0.05 + g.progress * 0.35, 0.2 + g.progress * 0.35, 0.8 + g.progress * 0.1, 0.9 + g.progress * 0.1)
                ZStack {
                    Circle()
                        .fill(.mint)
                        .frame(width: 7, height: 7)
                        .scaleEffect(1 + 2 * shaped)
                        .opacity(1 - shaped)
                    g.text
                        .foregroundStyle(.mint)
                        .scaleEffect(0.3 + 0.7 * shaped)
                        .blur(radius: (1 - shaped) * 3)
                        .opacity(shaped)
                }
            }
        }
    }
}

#Preview {
    Forming()
}
