//
//  Warping.swift
//  AgenThinking
//  Meaning: Bending out of shape; also, traveling at warp speed.
//  Use case: When an agent reshapes data or jumps quickly across a large codebase.
//  Motion: A gravitational lens slides across the word, magnifying and pulling letters toward its center with a 3-D bulge and violet chromatic shift.
//

import SwiftUI

struct Warping: View {
    var body: some View {
        Clock { t in
            let lens = sin(t * 1.1) * 0.6 + 0.5
            Glyphs("Warping", time: t, spacing: 2) { g in
                let distance = g.progress - lens
                let bulge = Motion.bell(distance / 0.22)
                g.text
                    .foregroundStyle(Color.white.mix(Color(red: 0.7, green: 0.5, blue: 1), bulge))
                    .scaleEffect(1 + 0.6 * bulge)
                    .offset(x: -distance * 18 * bulge)
                    .rotation3DEffect(.degrees(-distance * 90 * bulge), axis: (x: 0, y: 1, z: 0), perspective: 0.8)
                    .shadow(color: .purple.opacity(bulge), radius: 6 * bulge)
                    .zIndex(bulge)
            }
        }
    }
}

#Preview {
    Warping()
}
