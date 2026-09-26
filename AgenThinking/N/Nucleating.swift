//
//  Nucleating.swift
//  AgenThinking
//  Meaning: The first tiny seed from which a structure grows.
//  Use case: When an agent forms the first core insight that everything else builds on.
//  Motion: Bright nuclei flash at random spots with a shockwave ring, and letters crystallize outward from each one.
//

import SwiftUI

struct Nucleating: View {
    private let lime = Color(red: 0.7, green: 1, blue: 0.3)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.8)
            Glyphs("Nucleating", time: t) { g in
                let seedAt = 0.05 + g.random(g.cycle(3.8)) * 0.5
                let nucleus = Motion.window(beat, seedAt, seedAt + 0.02, seedAt + 0.04, seedAt + 0.12)
                let grow = Motion.window(beat, seedAt + 0.02, seedAt + 0.14, 0.88, 1)
                let ring = Motion.ramp(beat, seedAt, seedAt + 0.18)
                g.text
                    .foregroundStyle(lime.mix(.white, 1 - grow))
                    .scaleEffect(0.2 + 0.8 * grow)
                    .blur(radius: (1 - grow) * 3)
                    .opacity(grow)
                    .overlay {
                        ZStack {
                            Circle().fill(.white).frame(width: 5, height: 5).scaleEffect(nucleus * 1.5)
                            Circle()
                                .stroke(lime.opacity(ring > 0 && ring < 1 ? 1 - ring : 0), lineWidth: 1.2)
                                .frame(width: 30 * ring, height: 30 * ring)
                        }
                    }
            }
        }
    }
}

#Preview {
    Nucleating()
}
