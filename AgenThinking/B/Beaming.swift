//
//  Beaming.swift
//  AgenThinking
//  Meaning: Radiating confidence and good news.
//  Use case: When an agent has a positive result it is about to share.
//  Motion: Sun rays slowly rotate behind glowing golden letters while a bright band passes through them.
//

import SwiftUI

struct Beaming: View {
    var body: some View {
        Clock { t in
            let beam = (sin(t * 2.2) + 1) / 2
            ZStack {
                ForEach(0..<14, id: \.self) { k in
                    Capsule()
                        .fill(LinearGradient(colors: [.yellow.opacity(0.55), .clear], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 80, height: 3)
                        .offset(x: 58)
                        .rotationEffect(.degrees(Double(k) * 360 / 14 + t * 18))
                }
                .opacity(0.25 + 0.5 * beam)
                .scaleEffect(0.9 + 0.2 * beam)

                Glyphs("Beaming", time: t) { g in
                    let flash = g.sweep(2.4)
                    g.text
                        .foregroundStyle(Color.yellow.mix(.white, 0.35 + 0.65 * flash))
                        .scaleEffect(1 + 0.1 * flash)
                }
                .glow(.yellow, radius: 6 + 10 * beam)
            }
        }
    }
}

#Preview {
    Beaming()
}
