//
//  Gitifying.swift
//  AgenThinking
//  Meaning: Putting work under version control.
//  Use case: When an agent stages, commits, branches, or merges changes.
//  Motion: The middle letters branch off onto a feature lane in git orange and merge back into main while the commit graph draws.
//

import SwiftUI

struct Gitifying: View {
    private let gitOrange = Color(red: 0.94, green: 0.31, blue: 0.2)

    var body: some View {
        Clock { t in
            let beat = Motion.phase(t, 3.6)
            let branch = Motion.window(beat, 0.1, 0.35, 0.65, 0.9)
            VStack(spacing: 6) {
                Glyphs("Gitifying", time: t) { g in
                    let onBranch = g.index >= 2 && g.index <= 6
                    g.text
                        .foregroundStyle(onBranch ? Color.white.mix(gitOrange, branch) : .white)
                        .offset(y: onBranch ? -10 * branch : 0)
                }
                .fontDesign(.monospaced)

                ZStack {
                    Rectangle().fill(.white.opacity(0.35)).frame(width: 150, height: 1.5)
                    BranchArc()
                        .trim(from: 0, to: Motion.ramp(beat, 0.1, 0.9))
                        .stroke(gitOrange, style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                        .frame(width: 90, height: 10)
                        .offset(y: -5)
                    HStack(spacing: 26) {
                        ForEach(0..<6, id: \.self) { k in
                            Circle()
                                .fill(k == 0 || k == 5 ? .white : gitOrange)
                                .frame(width: 6, height: 6)
                                .offset(y: k == 0 || k == 5 ? 0 : -10 * branch)
                                .opacity(k == 0 || k == 5 ? 1 : branch)
                        }
                    }
                }
            }
        }
    }
}

private struct BranchArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.addCurve(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY),
                       control1: CGPoint(x: rect.minX + rect.width * 0.12, y: rect.maxY),
                       control2: CGPoint(x: rect.minX + rect.width * 0.12, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.minX + rect.width * 0.75, y: rect.minY))
            p.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                       control1: CGPoint(x: rect.minX + rect.width * 0.88, y: rect.minY),
                       control2: CGPoint(x: rect.minX + rect.width * 0.88, y: rect.maxY))
        }
    }
}

#Preview {
    Gitifying()
}
