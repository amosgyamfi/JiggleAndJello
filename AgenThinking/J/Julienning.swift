//
//  Julienning.swift
//  AgenThinking
//  Meaning: Slicing into thin, even strips.
//  Use case: When an agent splits a big task or file into small, uniform chunks.
//  Motion: A blade sweeps across; each letter is masked into three thin strips that slide apart, then knit back together.
//

import SwiftUI

struct Julienning: View {
    private let period = 2.6
    private let blade = 0.1

    var body: some View {
        Clock { t in
            let head = Motion.phase(t, period) * (1 + 4 * blade) - 2 * blade
            ZStack {
                Glyphs("Julienning", time: t, spacing: 1) { g in
                    let cut = Motion.window(head - g.progress, 0, 0.05, 0.25, 0.45)
                    ZStack {
                        ForEach(0..<3, id: \.self) { strip in
                            g.text
                                .foregroundStyle(Color.orange.mix(.yellow, Double(strip) * 0.3))
                                .mask {
                                    GeometryReader { geo in
                                        Rectangle()
                                            .frame(width: geo.size.width / 3)
                                            .offset(x: Double(strip) * geo.size.width / 3)
                                    }
                                }
                                .offset(x: Double(strip - 1) * 1.8 * cut, y: (strip == 1 ? 1 : -1) * 4 * cut)
                        }
                    }
                }
                Capsule()
                    .fill(.white)
                    .frame(width: 1.5, height: 40)
                    .glow(.white, radius: 4)
                    .offset(x: (head - 0.5) * 140)
            }
        }
    }
}

#Preview {
    Julienning()
}
