# IQ Ball Puzzle

A browser-based puzzle game inspired by IQ Puzzler Pro. Place all colored ball pieces onto the board to fill every cell.

**[▶ Play Now](https://Gibiamie.github.io/IQ-Ball-Puzzle/)**

![IQ Ball Puzzle](https://img.shields.io/badge/HTML5-single%20file-orange?logo=html5)
![No dependencies](https://img.shields.io/badge/dependencies-none-brightgreen)
![Languages](https://img.shields.io/badge/languages-EN%20%7C%20ID-blue)

---

## How to Play

1. **Select** a piece from the right panel
2. **Hover** over the board to preview placement
3. **Click** a board cell to place the piece
4. Fill the entire board to complete the level

### Controls

| Action | Input |
|---|---|
| Rotate piece | `R` key or 🔄 button |
| Flip piece | `F` key or 🪞 button |
| Cancel selection | `ESC` |
| Undo last move | `Ctrl+Z` or ↩ button |
| Remove from board | Right-click on board |

---

## Features

- **4 levels** of increasing difficulty (4×4 → 5×5 → 5×7 → 4×5)
- **Hint system** — shows where the next piece should go
- **Auto-solve** — animates the full solution
- **Undo** — up to 30 moves back
- **Leaderboard** — top 5 times per level (stored in browser)
- **Streak** — tracks consecutive days played 🔥
- **Bilingual** — English & Indonesian (Bahasa Indonesia)

---

## Run Locally

No server required. Just open the file:

```
double-click index.html
```

Or serve it:

```bash
# Python
python -m http.server 8080

# Node.js
npx serve .
```

---

## Project Structure

```
index.html   # entire game — HTML + CSS + JS, zero dependencies
README.md
.gitignore
```

---

## Tech Stack

- Vanilla HTML5 / CSS3 / JavaScript
- No frameworks, no build tools, no dependencies
- `localStorage` for leaderboard & streak persistence

---

## License

MIT — free to use, modify, and distribute.
