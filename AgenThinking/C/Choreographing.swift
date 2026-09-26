//
//  Choreographing.swift
//  AgenThinking
//  Meaning: Planning a coordinated sequence of moves.
//  Use case: When an agent coordinates multiple sub-agents or ordered tool calls.
//  Motion: Using PhaseAnimator, letters move together through set formations (line, wave, arc, mirrored bow) with staggered springs.
//

import SwiftUI

struct Choreographing: View {
    private let letters = "Choreographing".map(String.init)

    var body: some View {
        PhaseAnimator(Formation.allCases) { formation in
            HStack(spacing: 0) {
                ForEach(letters.indices, id: \.self) { i in
                    let centered = Double(i) / Double(letters.count - 1) * 2 - 1
                    Text(letters[i])
                        .foregroundStyle(formation.color)
                        .rotationEffect(.degrees(formation.rotation(centered)))
                        .scaleEffect(formation.scale(centered))
                        .offset(y: formation.y(i, centered))
                        .animation(.spring(duration: 0.7, bounce: 0.4).delay(Double(i) * 0.035), value: formation)
                }
            }
        } animation: { _ in
            .spring(duration: 1.1)
        }
    }
}

private enum Formation: CaseIterable {
    case line, wave, arc, bow

    var color: Color {
        switch self {
        case .line: .white
        case .wave: .cyan
        case .arc: .mint
        case .bow: .pink
        }
    }

    func y(_ index: Int, _ centered: Double) -> Double {
        switch self {
        case .line: 0
        case .wave: sin(Double(index) * 0.9) * 9
        case .arc: centered * centered * 18 - 9
        case .bow: abs(centered) * -8
        }
    }

    func rotation(_ centered: Double) -> Double {
        switch self {
        case .line, .wave: 0
        case .arc: centered * 16
        case .bow: -centered * 22
        }
    }

    func scale(_ centered: Double) -> Double {
        switch self {
        case .bow: 1.2 - 0.25 * abs(centered)
        default: 1
        }
    }
}

#Preview {
    Choreographing()
}
