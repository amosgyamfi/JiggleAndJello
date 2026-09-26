//
//  Processing.swift
//  AgenThinking
//  Meaning: Working through input step by step.
//  Use case: The general-purpose "busy" state while an agent handles a request.
//  Motion: A thin ring spinner turns while an OpenAI-style silver shimmer glides smoothly across the gray text.
//

import SwiftUI

struct Processing: View {
    var body: some View {
        Clock { t in
            HStack(spacing: 10) {
                Circle()
                    .trim(from: 0, to: 0.3 + 0.4 * (sin(t * 2.5) + 1) / 2)
                    .stroke(.white, style: StrokeStyle(lineWidth: 2.5, lineCap: .round))
                    .frame(width: 16, height: 16)
                    .rotationEffect(.degrees(t * 360))

                Text("Processing")
                    .foregroundStyle(Agent.openAI)
                    .shimmer(t, period: 1.8, color: .white, width: 0.18)
            }
        }
    }
}

#Preview {
    Processing()
}
