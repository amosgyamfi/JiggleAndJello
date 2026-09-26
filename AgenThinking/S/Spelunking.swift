//
//  Spelunking.swift
//  AgenThinking
//  Meaning: Exploring deep, dark caves.
//  Use case: When an agent explores an unfamiliar, poorly documented system.
//  Motion: In pitch dark, a headlamp beam wanders erratically, revealing warm, lit letters only where it points.
//

import SwiftUI

struct Spelunking: View {
    private let letterWidth = 12.5

    var body: some View {
        Clock { t in
            let beamX = Motion.noise(t * 0.7, seed: 3) * 80
            let beamY = Motion.noise(t * 0.9, seed: 4) * 6
            ZStack {
                Ellipse()
                    .fill(RadialGradient(colors: [Color(red: 1, green: 0.9, blue: 0.6).opacity(0.35), .clear], center: .center, startRadius: 0, endRadius: 40))
                    .frame(width: 90, height: 60)
                    .offset(x: beamX, y: beamY)

                Glyphs("Spelunking", time: t) { g in
                    let letterX = (g.i - Double(g.count - 1) / 2) * letterWidth
                    let lit = Motion.bell((letterX - beamX) / 42)
                    g.text
                        .foregroundStyle(Color(white: 0.12).mix(Color(red: 1, green: 0.88, blue: 0.6), lit))
                        .shadow(color: .orange.opacity(0.6 * lit), radius: 4)
                }

                Image(systemName: "flashlight.on.fill")
                    .font(.system(size: 13))
                    .foregroundStyle(.yellow)
                    .rotationEffect(.degrees(beamX * 0.35))
                    .offset(x: beamX * 0.4, y: 32)
            }
        }
    }
}

#Preview {
    Spelunking()
}
