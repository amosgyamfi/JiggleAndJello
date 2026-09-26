//
//  Transfiguring.swift
//  AgenThinking
//  Meaning: Transforming into something more beautiful or elevated.
//  Use case: When an agent elevates a rough draft into polished output.
//  Motion: A radiant wave passes through; each letter lifts, flares brilliant white with rays, and emerges in a new hue.
//

import SwiftUI

struct Transfiguring: View {
    var body: some View {
        Clock { t in
            Glyphs("Transfiguring", time: t) { g in
                let radiance = g.sweep(3.2, width: 0.12)
                let generation = floor(t / 3.2 - (g.progress + 0.24) / 1.48) * 0.18
                g.text
                    .foregroundStyle(Color(hue: Motion.phase(0.72 + generation, 1), saturation: 0.45, brightness: 1).mix(.white, radiance))
                    .scaleEffect(1 + 0.3 * radiance)
                    .offset(y: -6 * radiance)
                    .background {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(.yellow.opacity(0.6))
                            .scaleEffect(radiance)
                            .rotationEffect(.degrees(t * 60))
                            .blur(radius: 2)
                    }
                    .glow(.white.opacity(radiance), radius: 8 * radiance)
            }
        }
    }
}

#Preview {
    Transfiguring()
}
