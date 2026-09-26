//
//  Motion.swift
//  AgenThinking
//  Shared math for time-driven, per-letter animation.
//

import SwiftUI

/// One letter of an animated word, plus the clock and position data needed to animate it.
struct Glyph {
    let character: String
    let index: Int
    let count: Int
    /// Seconds since the animation appeared.
    let time: Double

    var text: Text { Text(character) }
    var i: Double { Double(index) }
    var n: Double { Double(count) }
    /// 0 at the first letter, 1 at the last.
    var progress: Double { count > 1 ? i / (n - 1) : 0 }
    /// -1 at the first letter, 0 in the middle, 1 at the last.
    var centered: Double { progress * 2 - 1 }
    var isEven: Bool { index.isMultiple(of: 2) }

    /// Sine wave in -1...1, delayed by `lag` cycles per letter.
    func wave(_ speed: Double = 1, lag: Double = 0.1) -> Double {
        sin((time * speed - i * lag) * 2 * .pi)
    }

    /// `wave` remapped to 0...1.
    func pulse(_ speed: Double = 1, lag: Double = 0.1) -> Double {
        (wave(speed, lag: lag) + 1) / 2
    }

    /// Repeating 0..<1 phase with a `period` in seconds, delayed by `lag` seconds per letter.
    func phase(_ period: Double, lag: Double = 0) -> Double {
        Motion.phase(time - i * lag, period)
    }

    /// Number of completed loops, handy for re-rolling random choices every cycle.
    func cycle(_ period: Double, lag: Double = 0) -> Int {
        Int(floor((time - i * lag) / period))
    }

    /// 0...1 intensity of a highlight band that sweeps left to right once per `period`.
    /// `offset` shifts the band by a fraction of the period so several bands can chase each other.
    func sweep(_ period: Double, width: Double = 0.18, offset: Double = 0, reversed: Bool = false) -> Double {
        let head = Motion.phase(time + offset * period, period) * (1 + 4 * width) - 2 * width
        let position = reversed ? 1 - progress : progress
        return Motion.bell((position - head) / width)
    }

    /// Stable pseudo-random value in 0...1 for this letter.
    func random(_ salt: Int = 0) -> Double {
        Motion.random(index, salt)
    }

    /// Smooth wandering value in -1...1, unique per letter.
    func noise(_ speed: Double = 1, salt: Int = 0) -> Double {
        Motion.noise(time * speed, seed: index &* 97 &+ salt)
    }
}

enum Motion {
    /// Fractional part of `t / period`, in 0..<1.
    static func phase(_ t: Double, _ period: Double) -> Double {
        let x = t / period
        return x - floor(x)
    }

    /// Hermite smoothstep of `x` clamped to 0...1.
    static func smooth(_ x: Double) -> Double {
        let c = min(max(x, 0), 1)
        return c * c * (3 - 2 * c)
    }

    /// Eases from 0 to 1 while `x` moves from `a` to `b`.
    static func ramp(_ x: Double, _ a: Double, _ b: Double) -> Double {
        smooth((x - a) / (b - a))
    }

    /// Rises over `a...b`, holds, then falls over `c...d`.
    static func window(_ x: Double, _ a: Double, _ b: Double, _ c: Double, _ d: Double) -> Double {
        ramp(x, a, b) * (1 - ramp(x, c, d))
    }

    /// Gaussian bump: 1 at 0, about 0.05 at ±1.
    static func bell(_ x: Double) -> Double {
        exp(-3 * x * x)
    }

    /// Triangle wave in -1...1 for a 0..<1 phase.
    static func triangle(_ phase: Double) -> Double {
        1 - 4 * abs(phase - 0.5)
    }

    /// Parabolic hop: 0 at the ends, 1 at the middle of a 0...1 phase.
    static func hop(_ phase: Double) -> Double {
        let p = min(max(phase, 0), 1)
        return 4 * p * (1 - p)
    }

    /// Damped spring settling from 1 toward 0 over a 0...1 phase.
    static func spring(_ phase: Double, bounces: Double = 3) -> Double {
        let p = min(max(phase, 0), 1)
        return exp(-5 * p) * cos(p * bounces * 2 * .pi)
    }

    /// Damped wobble that kicks off from 0, peaks, and settles back to 0 over a 0...1 phase.
    static func wobble(_ phase: Double, bounces: Double = 3) -> Double {
        let p = min(max(phase, 0), 1)
        return exp(-4 * p) * sin(p * bounces * 2 * .pi) * 1.6
    }

    /// Deterministic hash of two integers mapped to 0...1.
    static func random(_ a: Int, _ b: Int = 0) -> Double {
        var h = UInt64(bitPattern: Int64(a &* 73_856_093 ^ b &* 19_349_663)) &+ 0x9E37_79B9_7F4A_7C15
        h = (h ^ (h >> 30)) &* 0xBF58_476D_1CE4_E5B9
        h = (h ^ (h >> 27)) &* 0x94D0_49BB_1331_11EB
        h ^= h >> 31
        return Double(h % 10_000) / 10_000
    }

    /// Smooth 1-D value noise in -1...1.
    static func noise(_ t: Double, seed: Int = 0) -> Double {
        let cell = Int(floor(t))
        let f = t - floor(t)
        let a = random(cell, seed) * 2 - 1
        let b = random(cell + 1, seed) * 2 - 1
        return a + (b - a) * smooth(f)
    }
}
