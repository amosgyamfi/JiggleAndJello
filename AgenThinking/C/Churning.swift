//
//  Churning.swift
//  AgenThinking
//  Meaning: Working through material with steady, repetitive effort.
//  Use case: When an agent grinds through a large batch of files or records.
//  Motion: Cream letters spin continuously around their vertical axis in a rolling wave while the word plunges like a butter churn.
//

import SwiftUI

struct Churning: View {
    var body: some View {
        Clock { t in
            let plunge = sin(t * 4 * .pi / 1.6)
            Glyphs("Churning", time: t, spacing: 1) { g in
                let angle = t * 200 - g.i * 30
                let facing = abs(cos(angle * .pi / 180))
                g.text
                    .foregroundStyle(Color(red: 1, green: 0.96, blue: 0.82).mix(.yellow, 1 - facing))
                    .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0), perspective: 0.5)
            }
            .offset(y: 4 * plunge)
            .scaleEffect(x: 1 + 0.03 * plunge, y: 1 - 0.03 * plunge)
        }
    }
}

#Preview {
    Churning()
}
