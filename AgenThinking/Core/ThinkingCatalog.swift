//
//  ThinkingCatalog.swift
//  AgenThinking
//  Registry of all 184 thinking animations in alphabetical order.
//

import SwiftUI

struct ThinkingAnimation: Identifiable {
    let name: String
    let number: Int
    let view: () -> AnyView

    var id: String { name }
    var letter: String { String(name.prefix(1)).uppercased() }
}

enum Catalog {
    static let all: [ThinkingAnimation] = entries.enumerated().map { offset, entry in
        ThinkingAnimation(name: entry.0, number: offset + 1, view: entry.1)
    }

    private static func make<V: View>(_ name: String, _ view: @escaping () -> V) -> (String, () -> AnyView) {
        (name, { AnyView(view()) })
    }

    private static let entries: [(String, () -> AnyView)] = [
        // A
        make("Accomplishing") { Accomplishing() },
        make("Actioning") { Actioning() },
        make("Actualizing") { Actualizing() },
        make("Architecting") { Architecting() },
        // B
        make("Baking") { Baking() },
        make("Beaming") { Beaming() },
        make("Beboppin'") { Beboppin() },
        make("Befuddling") { Befuddling() },
        make("Billowing") { Billowing() },
        make("Blanching") { Blanching() },
        make("Bloviating") { Bloviating() },
        make("Boogieing") { Boogieing() },
        make("Boondoggling") { Boondoggling() },
        make("Booping") { Booping() },
        make("Bootstrapping") { Bootstrapping() },
        make("Brewing") { Brewing() },
        make("Burrowing") { Burrowing() },
        // C
        make("Calculating") { Calculating() },
        make("Canoodling") { Canoodling() },
        make("Caramelizing") { Caramelizing() },
        make("Cascading") { Cascading() },
        make("Catapulting") { Catapulting() },
        make("Cerebrating") { Cerebrating() },
        make("Channeling") { Channeling() },
        make("Channelling") { Channelling() },
        make("Choreographing") { Choreographing() },
        make("Churning") { Churning() },
        make("Clauding") { Clauding() },
        make("Coalescing") { Coalescing() },
        make("Cogitating") { Cogitating() },
        make("Combobulating") { Combobulating() },
        make("Composing") { Composing() },
        make("Computing") { Computing() },
        make("Concocting") { Concocting() },
        make("Considering") { Considering() },
        make("Contemplating") { Contemplating() },
        make("Cooking") { Cooking() },
        make("Crafting") { Crafting() },
        make("Creating") { Creating() },
        make("Crunching") { Crunching() },
        make("Crystallizing") { Crystallizing() },
        make("Cultivating") { Cultivating() },
        // D
        make("Deciphering") { Deciphering() },
        make("Deliberating") { Deliberating() },
        make("Determining") { Determining() },
        make("Dilly-dallying") { DillyDallying() },
        make("Discombobulating") { Discombobulating() },
        make("Doing") { Doing() },
        make("Doodling") { Doodling() },
        make("Drizzling") { Drizzling() },
        // E
        make("Ebbing") { Ebbing() },
        make("Effecting") { Effecting() },
        make("Elucidating") { Elucidating() },
        make("Embellishing") { Embellishing() },
        make("Enchanting") { Enchanting() },
        make("Envisioning") { Envisioning() },
        make("Evaporating") { Evaporating() },
        // F
        make("Fermenting") { Fermenting() },
        make("Fiddle-faddling") { FiddleFaddling() },
        make("Finagling") { Finagling() },
        make("Flambéing") { Flambeing() },
        make("Flibbertigibbeting") { Flibbertigibbeting() },
        make("Flowing") { Flowing() },
        make("Flummoxing") { Flummoxing() },
        make("Fluttering") { Fluttering() },
        make("Forging") { Forging() },
        make("Forming") { Forming() },
        make("Frolicking") { Frolicking() },
        make("Frosting") { Frosting() },
        // G
        make("Gallivanting") { Gallivanting() },
        make("Galloping") { Galloping() },
        make("Garnishing") { Garnishing() },
        make("Generating") { Generating() },
        make("Germinating") { Germinating() },
        make("Gitifying") { Gitifying() },
        make("Grooving") { Grooving() },
        make("Gusting") { Gusting() },
        // H
        make("Harmonizing") { Harmonizing() },
        make("Hashing") { Hashing() },
        make("Hatching") { Hatching() },
        make("Herding") { Herding() },
        make("Honking") { Honking() },
        make("Hullaballooing") { Hullaballooing() },
        make("Hyperspacing") { Hyperspacing() },
        // I
        make("Ideating") { Ideating() },
        make("Imagining") { Imagining() },
        make("Improvising") { Improvising() },
        make("Incubating") { Incubating() },
        make("Inferring") { Inferring() },
        make("Infusing") { Infusing() },
        make("Ionizing") { Ionizing() },
        // J
        make("Jitterbugging") { Jitterbugging() },
        make("Julienning") { Julienning() },
        // K
        make("Kneading") { Kneading() },
        // L
        make("Leavening") { Leavening() },
        make("Levitating") { Levitating() },
        make("Lollygagging") { Lollygagging() },
        // M
        make("Manifesting") { Manifesting() },
        make("Marinating") { Marinating() },
        make("Meandering") { Meandering() },
        make("Metamorphosing") { Metamorphosing() },
        make("Misting") { Misting() },
        make("Moonwalking") { Moonwalking() },
        make("Moseying") { Moseying() },
        make("Mulling") { Mulling() },
        make("Mustering") { Mustering() },
        make("Musing") { Musing() },
        // N
        make("Nebulizing") { Nebulizing() },
        make("Nesting") { Nesting() },
        make("Noodling") { Noodling() },
        make("Nucleating") { Nucleating() },
        // O
        make("Orbiting") { Orbiting() },
        make("Orchestrating") { Orchestrating() },
        make("Osmosing") { Osmosing() },
        // P
        make("Perambulating") { Perambulating() },
        make("Percolating") { Percolating() },
        make("Perusing") { Perusing() },
        make("Philosophising") { Philosophising() },
        make("Photosynthesizing") { Photosynthesizing() },
        make("Pollinating") { Pollinating() },
        make("Pondering") { Pondering() },
        make("Pontificating") { Pontificating() },
        make("Pouncing") { Pouncing() },
        make("Precipitating") { Precipitating() },
        make("Prestidigitating") { Prestidigitating() },
        make("Processing") { Processing() },
        make("Proofing") { Proofing() },
        make("Propagating") { Propagating() },
        make("Puttering") { Puttering() },
        make("Puzzling") { Puzzling() },
        // Q
        make("Quantumizing") { Quantumizing() },
        // R
        make("Razzle-dazzling") { RazzleDazzling() },
        make("Razzmatazzing") { Razzmatazzing() },
        make("Recombobulating") { Recombobulating() },
        make("Reticulating") { Reticulating() },
        make("Roosting") { Roosting() },
        make("Ruminating") { Ruminating() },
        // S
        make("Sautéing") { Sauteing() },
        make("Scampering") { Scampering() },
        make("Schlepping") { Schlepping() },
        make("Scurrying") { Scurrying() },
        make("Seasoning") { Seasoning() },
        make("Shenaniganing") { Shenaniganing() },
        make("Shimmying") { Shimmying() },
        make("Simmering") { Simmering() },
        make("Skedaddling") { Skedaddling() },
        make("Sketching") { Sketching() },
        make("Slithering") { Slithering() },
        make("Smooshing") { Smooshing() },
        make("Sock-hopping") { SockHopping() },
        make("Spelunking") { Spelunking() },
        make("Spinning") { Spinning() },
        make("Sprouting") { Sprouting() },
        make("Stewing") { Stewing() },
        make("Sublimating") { Sublimating() },
        make("Swirling") { Swirling() },
        make("Swooping") { Swooping() },
        make("Symbioting") { Symbioting() },
        make("Synthesizing") { Synthesizing() },
        // T
        make("Tempering") { Tempering() },
        make("Thinking") { Thinking() },
        make("Thundering") { Thundering() },
        make("Tinkering") { Tinkering() },
        make("Tomfoolering") { Tomfoolering() },
        make("Topsy-turvying") { TopsyTurvying() },
        make("Transfiguring") { Transfiguring() },
        make("Transmuting") { Transmuting() },
        make("Twisting") { Twisting() },
        // U
        make("Undulating") { Undulating() },
        make("Unfurling") { Unfurling() },
        make("Unravelling") { Unravelling() },
        // V
        make("Vibing") { Vibing() },
        // W
        make("Waddling") { Waddling() },
        make("Wandering") { Wandering() },
        make("Warping") { Warping() },
        make("Whatchamacalliting") { Whatchamacalliting() },
        make("Whirlpooling") { Whirlpooling() },
        make("Whirring") { Whirring() },
        make("Whisking") { Whisking() },
        make("Wibbling") { Wibbling() },
        make("Working") { Working() },
        make("Wrangling") { Wrangling() },
        // Z
        make("Zesting") { Zesting() },
        make("Zigzagging") { Zigzagging() },
    ]
}
