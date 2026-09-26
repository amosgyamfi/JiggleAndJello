//
//  Clock.swift
//  AgenThinking
//  Timeline-driven building blocks shared by every animation.
//

import SwiftUI

/// Redraws its content every frame with the seconds elapsed since it appeared.
struct Clock<Content: View>: View {
    private let content: (Double) -> Content
    @State private var start = Date.now

    init(@ViewBuilder content: @escaping (Double) -> Content) {
        self.content = content
    }

    var body: some View {
        TimelineView(.animation) { context in
            content(context.date.timeIntervalSince(start))
        }
    }
}

/// Lays a word out letter by letter, handing each letter its `Glyph` for the given time.
struct Glyphs<Letter: View>: View {
    private let characters: [String]
    private let time: Double
    private let spacing: CGFloat
    private let letter: (Glyph) -> Letter

    init(_ text: String, time: Double, spacing: CGFloat = 0, @ViewBuilder letter: @escaping (Glyph) -> Letter) {
        self.characters = text.map(String.init)
        self.time = time
        self.spacing = spacing
        self.letter = letter
    }

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(characters.indices, id: \.self) { index in
                letter(Glyph(character: characters[index], index: index, count: characters.count, time: time))
            }
        }
    }
}

/// A `Glyphs` row driven by its own `Clock`.
struct AnimatedGlyphs<Letter: View>: View {
    private let text: String
    private let spacing: CGFloat
    private let letter: (Glyph) -> Letter

    init(_ text: String, spacing: CGFloat = 0, @ViewBuilder letter: @escaping (Glyph) -> Letter) {
        self.text = text
        self.spacing = spacing
        self.letter = letter
    }

    var body: some View {
        Clock { t in
            Glyphs(text, time: t, spacing: spacing, letter: letter)
        }
    }
}

/// Loops `count` particles; each receives its index and a 0..<1 life phase, offset so they don't move in lockstep.
struct Particles<Particle: View>: View {
    private let count: Int
    private let time: Double
    private let period: Double
    private let particle: (Int, Double) -> Particle

    init(_ count: Int, time: Double, period: Double, @ViewBuilder particle: @escaping (Int, Double) -> Particle) {
        self.count = count
        self.time = time
        self.period = period
        self.particle = particle
    }

    var body: some View {
        ZStack {
            ForEach(0..<count, id: \.self) { k in
                particle(k, Motion.phase(time + Motion.random(k, 7_331) * period, period))
            }
        }
        .allowsHitTesting(false)
    }
}
