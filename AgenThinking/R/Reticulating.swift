//
//  Reticulating.swift
//  AgenThinking
//  Meaning: Forming a network or mesh (as in SimCity's famous "reticulating splines").
//  Use case: When an agent builds a graph, index, or dependency map.
//  Motion: A green wireframe mesh undulates in perspective and the letters ride its spline surface like terrain.
//

import SwiftUI

struct Reticulating: View {
    private let letterWidth = 14.0

    var body: some View {
        Clock { t in
            ZStack {
                Mesh(time: t)
                    .stroke(Color.green.opacity(0.45), lineWidth: 0.7)
                    .frame(width: 240, height: 70)

                Glyphs("Reticulating", time: t) { g in
                    let x = (g.i - Double(g.count - 1) / 2) * letterWidth
                    g.text
                        .foregroundStyle(Color(red: 0.6, green: 1, blue: 0.6))
                        .offset(y: Mesh.height(x: x, z: 0, t: t) - 8)
                }
            }
            .rotation3DEffect(.degrees(48), axis: (x: 1, y: 0, z: 0), perspective: 0.55)
        }
    }
}

private struct Mesh: Shape {
    var time: Double

    static func height(x: Double, z: Double, t: Double) -> Double {
        sin(x / 28 + t * 1.6) * 5 + cos(z / 18 - t) * 3
    }

    func path(in rect: CGRect) -> Path {
        Path { p in
            let columns = 16, rows = 5
            for r in 0...rows {
                let z = rect.minY + rect.height * Double(r) / Double(rows)
                for c in 0...columns {
                    let x = rect.minX + rect.width * Double(c) / Double(columns)
                    let point = CGPoint(x: x, y: z + Mesh.height(x: x - rect.midX, z: z, t: time))
                    if c == 0 { p.move(to: point) } else { p.addLine(to: point) }
                }
            }
            for c in 0...columns {
                let x = rect.minX + rect.width * Double(c) / Double(columns)
                for r in 0...rows {
                    let z = rect.minY + rect.height * Double(r) / Double(rows)
                    let point = CGPoint(x: x, y: z + Mesh.height(x: x - rect.midX, z: z, t: time))
                    if r == 0 { p.move(to: point) } else { p.addLine(to: point) }
                }
            }
        }
    }
}

#Preview {
    Reticulating()
}
