//
//  Musing.swift
//  AgenThinking
//  Meaning: Idly wondering; a gentle, drifting train of thought.
//  Use case: When an agent reflects aloud or considers tangential ideas.
//  Motion: The word tilts in reverie as thought bubbles float up from its end, growing into a softly pulsing cloud.
//

import SwiftUI

struct Musing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3)
            ZStack(alignment: .topTrailing) {
                Glyphs("Musing", time: t, spacing: 1) { g in
                    g.text
                        .foregroundStyle(Color(red: 0.82, green: 0.75, blue: 1))
                        .offset(y: g.wave(0.3, lag: 0.1) * 2)
                }
                .rotationEffect(.degrees(sin(t * 0.8) * 4))
                .padding(.trailing, 44)
                .padding(.top, 18)

                ForEach(0..<3, id: \.self) { k in
                    let appear = Motion.window(beat, Double(k) * 0.15, Double(k) * 0.15 + 0.1, 0.85, 1)
                    let size = [5.0, 8.0, 22.0][k]
                    Group {
                        if k == 2 {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: size))
                        } else {
                            Circle().frame(width: size, height: size)
                        }
                    }
                    .foregroundStyle(.white.opacity(0.7))
                    .scaleEffect(appear * (k == 2 ? 1 + 0.08 * sin(t * 4) : 1))
                    .offset(x: [-30.0, -18.0, 0][k], y: [14.0, 4.0, -12.0][k])
                }
            }
        }
    }
}

#Preview {
    Musing()
}
