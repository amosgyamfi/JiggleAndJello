//
//  Metamorphosing.swift
//  AgenThinking
//  Meaning: Transforming completely into a new form.
//  Use case: When an agent migrates code to a new framework, language, or architecture.
//  Motion: Letters flip over in 3-D one by one, turning from green rounded caterpillar type into purple serif butterfly italics, and back.
//

import SwiftUI

struct Metamorphosing: View {
    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 5)
            Glyphs("Metamorphosing", time: t) { g in
                let start = g.progress * 0.25
                let flip = Motion.window(beat, start, start + 0.12, 0.55 + start, 0.67 + start)
                let angle = flip * 180
                let butterfly = angle > 90
                g.text
                    .italic(butterfly)
                    .fontDesign(butterfly ? .serif : .rounded)
                    .foregroundStyle(butterfly ? Color(red: 0.8, green: 0.55, blue: 1) : Color(red: 0.55, green: 0.85, blue: 0.4))
                    .rotation3DEffect(.degrees(butterfly ? angle - 180 : angle), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
            }
        }
    }
}

#Preview {
    Metamorphosing()
}
