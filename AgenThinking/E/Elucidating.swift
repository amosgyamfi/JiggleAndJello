//
//  Elucidating.swift
//  AgenThinking
//  Meaning: Making something clear by shedding light on it.
//  Use case: When an agent explains its reasoning or clarifies a concept.
//  Motion: A cone of light widens down onto the word, turning dim, blurry letters bright and sharp from the center outward.
//

import SwiftUI

struct Elucidating: View {
    var body: some View {
        Clock { t in
            let light = Motion.window(Motion.phase(t, 4), 0.05, 0.45, 0.8, 1)
            ZStack {
                LightCone()
                    .fill(LinearGradient(colors: [.yellow.opacity(0.35), .clear], startPoint: .top, endPoint: .bottom))
                    .frame(width: 60 + 160 * light, height: 90)
                    .opacity(light)
                    .blur(radius: 6)
                    .offset(y: -10)

                Glyphs("Elucidating", time: t) { g in
                    let clear = Motion.ramp(light * 1.4 - abs(g.centered) * 0.4, 0, 1)
                    g.text
                        .foregroundStyle(Color(white: 0.3).mix(Color(red: 1, green: 0.97, blue: 0.85), clear))
                        .blur(radius: (1 - clear) * 2)
                }
            }
        }
    }
}

private struct LightCone: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.midX - 6, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.midX + 6, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.closeSubpath()
        }
    }
}

#Preview {
    Elucidating()
}
