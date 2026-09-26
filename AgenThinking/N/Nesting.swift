//
//  Nesting.swift
//  AgenThinking
//  Meaning: Placing things inside one another, layer within layer.
//  Use case: When an agent works through nested structures: folders, JSON, or recursive calls.
//  Motion: Copies of the word nest inside each other like Russian dolls and endlessly zoom outward, each layer a new hue.
//

import SwiftUI

struct Nesting: View {
    private let layers = 4

    var body: some View {
        Clock { t in
            let zoom = Motion.phase(t, 1.8)
            ZStack {
                ForEach(0..<layers, id: \.self) { k in
                    let depth = Double(k) + zoom
                    let scale = pow(1.6, depth - Double(layers) + 1)
                    Text("Nesting")
                        .foregroundStyle(Color(hue: Motion.phase(0.55 + (Double(k) - floor(t / 1.8)) * 0.12, 1), saturation: 0.5, brightness: 1))
                        .scaleEffect(scale)
                        .opacity(Motion.ramp(scale, 0.15, 0.4) * (1 - Motion.ramp(scale, 1, 1.5)))
                }
            }
        }
    }
}

#Preview {
    Nesting()
}
