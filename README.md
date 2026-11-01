# timie 🍜

**timie** is a cute, minimal noodle-cooking timer for iPhone and iPad, built with SwiftUI. Pick how you like your noodles, tap *Start Cooking*, and timie counts down while showing your noodles cooking — plus a fun noodle fact to keep you company.

Built as part of **Challenge 2 (Clock)** at the **Apple Developer Academy**.

---

## ✨ Features

- **Choose your doneness level** — swipe through a snapping card carousel:

  | Level   | Time   | Description                               |
  |---------|--------|-------------------------------------------|
  | Firm    | 1 min  | Still kind of hard...                     |
  | Perfect | 3 mins | Perfectly cooked                          |
  | Soft    | 4 mins | For someone who loves soft soft noodles   |

- **Animated countdown** — large `MM:SS` timer with a circular progress ring and a moving indicator dot.
- **Progressive illustrations** — the noodle illustration changes as cooking progresses.
- **Pause / resume** the timer at any time.
- **Finish early** with the *Done* button.
- **Cancel safely** — tapping ✕ pauses the timer and asks for confirmation before stopping.
- **Noodle facts** — a random noodle fun fact rotates every 5 seconds.
- **"Time's up!" screen** — plays a looping alert sound until you head back home.

## 📱 Screens

1. **Level selection** (`LevelView`) — "How do you like your noodles?" with the level carousel and *Start Cooking* button.
2. **Timer** (`TimerView`) — countdown, progress ring, illustration, pause/done controls, and noodle facts.
3. **Completed** (`CompletedView`) — "Time's up! Enjoy it while it's hot :)" with alert sound and *Back to Home* button.

## 🛠 Tech Stack

- **Swift** + **SwiftUI**
- **Combine** — `Timer.publish` drives the 1-second tick and the 5-second fact rotation
- **AVFoundation** — `AVAudioPlayer` plays the completion sound
- SwiftUI scroll APIs — `scrollTargetBehavior(.viewAligned)`, `scrollPosition`, `scrollTransition` for the carousel

## 📂 Project Structure

```
timie/
├── timie.xcodeproj
└── timie/
    ├── timieApp.swift        # App entry point
    ├── LevelView.swift       # Home screen: level selection
    ├── CardCarousel.swift    # Horizontal snapping carousel
    ├── CardComponent.swift   # Single level card UI
    ├── Level.swift           # Level model (name, duration, description, illustration)
    ├── NoodleTimer.swift     # Timer model: start / pause / reset / tick / illustration progress
    ├── TimerView.swift       # Countdown screen
    ├── CompletedView.swift   # "Time's up!" screen + sound
    ├── audio/                # Completion sound (blip.wav)
    ├── Assets.xcassets       # Colors, illustrations, icons
    └── Info.plist
```

## 🚀 Getting Started

### Requirements

- Xcode 26 or later
- iOS / iPadOS 26.4 or later (deployment target)

### Run

```bash
git clone https://github.com/kykyramadhani/timie.git
```

```bash
open timie/timie.xcodeproj
```

Then select an iPhone simulator (or your device) and press **⌘R**.

## ⚙️ How It Works

- `NoodleTimer` is a value-type model holding the duration, remaining time, and state flags (`isStarted`, `isPaused`, `isDone`).
- Every second, `tick()` decrements `timeRemaining`. When it reaches zero, `isDone` flips to `true`, which presents `CompletedView` as a full-screen cover.
- `updateIllustration()` maps progress (`1 - remaining / duration`) to an index in the illustration list, so images advance evenly over the cooking time without a pile of `if`s.

## 👩‍💻 Team

- **Kyky**
- **Pelangi Romadoni**

Apple Developer Academy — Challenge 2
