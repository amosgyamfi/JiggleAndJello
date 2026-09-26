//
//  Marinating.swift
//  AgenThinking
//  Meaning: Soaking something so flavors sink in over time.
//  Use case: When an agent lets context or data sit and absorb before acting.
//  Motion: Letters bob in a rising and falling liquid; everything below the moving waterline takes on the marinade's color.
//

import SwiftUI

struct Marinating: View {
    private let marinade = Color(red: 0.85, green: 0.35, blue: 0.2)

    var body: some View {
        Clock { t in
            let level = 0.5 + 0.18 * sin(t * 0.8)
            ZStack {
                word(t).foregroundStyle(Color(red: 1, green: 0.93, blue: 0.85))
                word(t)
                    .foregroundStyle(marinade)
                    .mask { Liquid(phase: t * 2.2, level: level).frame(width: 240, height: 40) }
                Liquid(phase: t * 2.2, level: level)
                    .fill(marinade.opacity(0.18))
                    .frame(width: 240, height: 40)
            }
        }
    }

    private func word(_ t: Double) -> some View {
        Glyphs("Marinating", time: t) { g in
            g.text
                .offset(y: g.wave(0.35, lag: 0.12) * 3)
                .rotationEffect(.degrees(g.wave(0.3, lag: 0.2) * 5))
        }
    }
}

private struct Liquid: Shape {
    var phase: Double
    var level: Double

    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            for step in 0...40 {
                let x = Double(step) / 40
                let y = rect.minY + rect.height * level + sin(x * 4 * .pi + phase) * 2.5
                p.addLine(to: CGPoint(x: rect.minX + x * rect.width, y: y))
            }
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.closeSubpath()
        }
    }
}

#Preview {
    Marinating()
}
