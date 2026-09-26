//
//  ThinkingGrid.swift
//  AgenThinking
//  One scrollable, searchable grid showing every thinking animation, grouped A to Z.
//

import SwiftUI

struct ThinkingGrid: View {
    @State private var query = ""

    private var sections: [(letter: String, items: [ThinkingAnimation])] {
        let matches = query.isEmpty
            ? Catalog.all
            : Catalog.all.filter { $0.name.localizedCaseInsensitiveContains(query) }
        return Dictionary(grouping: matches, by: \.letter)
            .sorted { $0.key < $1.key }
            .map { (letter: $0.key, items: $0.value) }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 320), spacing: 14)],
                    spacing: 14,
                    pinnedViews: .sectionHeaders
                ) {
                    ForEach(sections, id: \.letter) { section in
                        Section {
                            ForEach(section.items) { ThinkingCard(animation: $0) }
                        } header: {
                            SectionHeader(letter: section.letter, count: section.items.count)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
            }
            .background(Color(white: 0.04))
            .navigationTitle("AgenThinking")
            .searchable(text: $query, prompt: "Search \(Catalog.all.count) animations")
        }
        .preferredColorScheme(.dark)
    }
}

private struct ThinkingCard: View {
    let animation: ThinkingAnimation

    var body: some View {
        animation.view()
            .font(Agent.word)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 124)
            .overlay(alignment: .bottomLeading) {
                Text(String(format: "%03d", animation.number))
                    .font(.caption2.monospacedDigit())
                    .foregroundStyle(.white.opacity(0.25))
                    .padding(10)
            }
            .background(.white.opacity(0.035), in: .rect(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(.white.opacity(0.08)))
            .clipShape(.rect(cornerRadius: 20))
    }
}

private struct SectionHeader: View {
    let letter: String
    let count: Int

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(letter)
                .font(.title2.weight(.bold))
            Text("\(count)")
                .font(.caption.monospacedDigit())
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(Color(white: 0.04).opacity(0.92))
    }
}

#Preview {
    ThinkingGrid()
}
