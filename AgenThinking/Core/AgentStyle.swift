//
//  AgentStyle.swift
//  AgenThinking
//  Colors and reusable visual effects inspired by AI assistant thinking states.
//

import SwiftUI

enum Agent {
    /// Anthropic Claude terracotta.
    static let claude = Color(red: 0.85, green: 0.47, blue: 0.34)
    /// OpenAI-style neutral gray for shimmering status text.
    static let openAI = Color(white: 0.55)
    /// Grok-style cold silver.
    static let grok = Color(white: 0.9)
    /// Kimi-style electric blue.
    static let kimi = Color(red: 0.15, green: 0.45, blue: 1.0)
    /// Gemini-style blue, violet, rose sweep.
    static let gemini: [Color] = [
        Color(red: 0.26, green: 0.52, blue: 0.96),
        Color(red: 0.61, green: 0.45, blue: 0.94),
        Color(red: 0.85, green: 0.40, blue: 0.64),
    ]

    static let word = Font.system(size: 24, weight: .semibold, design: .rounded)
}

extension Color {
    /// Linear blend between two colors, `amount` in 0...1.
    func mix(_ other: Color, _ amount: Double) -> Color {
        mix(with: other, by: min(max(amount, 0), 1))
    }
}

extension View {
    /// Soft two-layer bloom.
    func glow(_ color: Color, radius: CGFloat = 8) -> some View {
        shadow(color: color.opacity(0.9), radius: radius / 3)
            .shadow(color: color.opacity(0.5), radius: radius)
    }

    /// A highlight band that sweeps across the view's own shape, like AI "thinking" status text.
    func shimmer(_ time: Double, period: Double = 2, color: Color = .white, width: Double = 0.22) -> some View {
        let head = Motion.phase(time, period) * (1 + 4 * width) - 2 * width
        return overlay {
            LinearGradient(
                colors: [.clear, color, .clear],
                startPoint: UnitPoint(x: head - width, y: 0.5),
                endPoint: UnitPoint(x: head + width, y: 0.5)
            )
            .mask { self }
            .allowsHitTesting(false)
        }
    }

    /// Fills the view's shape with a single style spanning the whole word, instead of per letter.
    func paint<S: ShapeStyle>(_ style: S) -> some View {
        hidden().overlay {
            Rectangle().fill(style).padding(-40).mask { self }
        }
    }
}
