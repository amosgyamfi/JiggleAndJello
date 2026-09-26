# AgenThinking

184 SwiftUI "agent thinking" text animations — one for each of Claude Code's spinner verbs, from **Accomplishing** to **Zigzagging**. Each animation acts out what its word means: *Sprouting* letters spring up out of the soil, *Evaporating* drifts away as vapor, *Whatchamacalliting* forgets letters into `?`, and *Synthesizing* fuses red and blue copies into one bright word.

## Run

Open `AgenThinking.xcodeproj` and run the **AgenThinking** scheme on iOS, macOS, or visionOS 27. The app opens a single scrollable, searchable grid of every animation, grouped under pinned A–Z section headers.

Every animation file also has its own `#Preview`, so you can iterate on one word at a time in the Xcode canvas.

## Structure

```
AgenThinking/
├── AgenThinkingApp.swift     App entry → ThinkingGrid
├── Core/
│   ├── Motion.swift          Glyph (per-letter context) + Motion easing/noise math
│   ├── Clock.swift           Clock, Glyphs, AnimatedGlyphs, Particles
│   ├── AgentStyle.swift      Agent palettes, font, glow / shimmer / paint modifiers
│   ├── ThinkingCatalog.swift The ordered list of all 184 animations
│   └── ThinkingGrid.swift    LazyVGrid, section headers, search, cards
└── A/ … Z/                   One file per word, e.g. S/Sprouting.swift
```

### Core toolkit

- **`Clock { t in … }`** wraps `TimelineView(.animation)` and passes the seconds since the view appeared. Most animations are pure functions of `t`, so they loop seamlessly and never drift.
- **`Glyphs("Word", time: t) { g in … }`** lays out one view per character. Each `Glyph` knows its `index`, `progress` (0…1), and `centered` (−1…1) position, and offers `wave`, `pulse`, `phase`, `cycle`, `sweep`, `random`, and `noise` helpers for staggered per-letter motion.
- **`Motion`** holds the shared curves: `smooth`, `ramp`, `window`, `bell`, `triangle`, `hop`, `spring`, `wobble`, a deterministic hash `random`, and 1-D value `noise`.
- **`Particles(n, time:, period:) { k, life in … }`** drives looping sparks, steam, bubbles, and flakes.
- **`AgentStyle`** provides brand palettes (`Agent.claude`, `.openAI`, `.grok`, `.kimi`, `.gemini`), `Color.mix`, and three modifiers: `.glow`, `.shimmer` (a gradient masked by the text), and `.paint` (fills the whole word with one gradient).

### SwiftUI techniques used

| Technique | Examples |
|---|---|
| `scaleEffect`, anchored squash & stretch | Sprouting, Smooshing, Wibbling, Kneading |
| `rotationEffect` | Spinning, Tomfoolering, Tinkering, Wibbling |
| `rotation3DEffect` (x / y / z) + `perspective` | TopsyTurvying, Twisting, Unfurling, Accomplishing, Architecting |
| `hueRotation` | Accomplishing, Vibing, RazzleDazzling |
| `opacity` & `blur` | Evaporating, Sublimating, Misting, Whirring |
| `mask`-based shimmer & gradient paint | Processing, Thinking, Transmuting, Swirling |
| `blendMode(.plusLighter)` | Synthesizing |
| `PhaseAnimator` | Choreographing |
| `Canvas`, `Path`, custom shapes | Architecting, Wrangling, Zigzagging |
| SF Symbols as props | Swooping, Whirring, Thundering, Zesting |

## Add an animation

1. Create `X/Wording.swift`. The file header should say what the word means, when an agent would use it, and how the motion shows that meaning:

   ```swift
   //  Meaning: …
   //  Use case: …
   //  Motion: …

   struct Wording: View {
       var body: some View {
           Clock { t in
               Glyphs("Wording", time: t) { g in
                   g.text.offset(y: g.wave(0.8) * 4)
               }
           }
       }
   }
   ```

2. Add `make("Wording") { Wording() }` to `ThinkingCatalog.entries` in alphabetical order.

Guidelines:
- Keep each animation within its 124-pt card, and make sure the word is readable at some point in every loop.
- Avoid greedy views such as a bare `Color`.
- Make each loop end where it began, so it repeats without a visible jump.

## Inspirations

- **Claude / Anthropic**: the terracotta glyph spinner with a per-letter color sweep ([Claude Code's thinking animation](https://blog.alexbeals.com/posts/claude-codes-thinking-animation)). See Clauding.
- **OpenAI / ChatGPT**: the gray text shimmer and the streaming "●" cursor. See Processing and Generating.
- **Google Gemini**: the ✦ sparkle and blue-violet-rose gradients. See Thinking.
- **Grok (xAI)**: high-contrast monochrome white on black. See Hyperspacing's starfield.
- **Kimi (Moonshot AI)**: its signature blue. See Moonwalking.
- **CLI agents**: the braille dot spinner. See Computing.
- **[aicss.dev](https://www.aicss.dev/)**: shimmer masks, glows, orbital loaders, and gradient text.

## Index (184)

- **A (4):** Accomplishing, Actioning, Actualizing, Architecting
- **B (13):** Baking, Beaming, Beboppin', Befuddling, Billowing, Blanching, Bloviating, Boogieing, Boondoggling, Booping, Bootstrapping, Brewing, Burrowing
- **C (25):** Calculating, Canoodling, Caramelizing, Cascading, Catapulting, Cerebrating, Channeling, Channelling, Choreographing, Churning, Clauding, Coalescing, Cogitating, Combobulating, Composing, Computing, Concocting, Considering, Contemplating, Cooking, Crafting, Creating, Crunching, Crystallizing, Cultivating
- **D (8):** Deciphering, Deliberating, Determining, Dilly-dallying, Discombobulating, Doing, Doodling, Drizzling
- **E (7):** Ebbing, Effecting, Elucidating, Embellishing, Enchanting, Envisioning, Evaporating
- **F (12):** Fermenting, Fiddle-faddling, Finagling, Flambéing, Flibbertigibbeting, Flowing, Flummoxing, Fluttering, Forging, Forming, Frolicking, Frosting
- **G (8):** Gallivanting, Galloping, Garnishing, Generating, Germinating, Gitifying, Grooving, Gusting
- **H (7):** Harmonizing, Hashing, Hatching, Herding, Honking, Hullaballooing, Hyperspacing
- **I (7):** Ideating, Imagining, Improvising, Incubating, Inferring, Infusing, Ionizing
- **J (2):** Jitterbugging, Julienning
- **K (1):** Kneading
- **L (3):** Leavening, Levitating, Lollygagging
- **M (10):** Manifesting, Marinating, Meandering, Metamorphosing, Misting, Moonwalking, Moseying, Mulling, Mustering, Musing
- **N (4):** Nebulizing, Nesting, Noodling, Nucleating
- **O (3):** Orbiting, Orchestrating, Osmosing
- **P (16):** Perambulating, Percolating, Perusing, Philosophising, Photosynthesizing, Pollinating, Pondering, Pontificating, Pouncing, Precipitating, Prestidigitating, Processing, Proofing, Propagating, Puttering, Puzzling
- **Q (1):** Quantumizing
- **R (6):** Razzle-dazzling, Razzmatazzing, Recombobulating, Reticulating, Roosting, Ruminating
- **S (22):** Sautéing, Scampering, Schlepping, Scurrying, Seasoning, Shenaniganing, Shimmying, Simmering, Skedaddling, Sketching, Slithering, Smooshing, Sock-hopping, Spelunking, Spinning, Sprouting, Stewing, Sublimating, Swirling, Swooping, Symbioting, Synthesizing
- **T (9):** Tempering, Thinking, Thundering, Tinkering, Tomfoolering, Topsy-turvying, Transfiguring, Transmuting, Twisting
- **U (3):** Undulating, Unfurling, Unravelling
- **V (1):** Vibing
- **W (10):** Waddling, Wandering, Warping, Whatchamacalliting, Whirlpooling, Whirring, Whisking, Wibbling, Working, Wrangling
- **Z (2):** Zesting, Zigzagging

The `Meaning`, `Use case`, and `Motion` notes for each word are in the header comment of its Swift file.
