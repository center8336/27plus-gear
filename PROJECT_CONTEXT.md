# All-About-GEAR — Project Map

陳棉's project for *everything related to studio gear* at 27+ Home Studio. First
concrete deliverable is a one-page inventory site; other content types added
organically. This file is the **map** — when a task arises, route to the
relevant skill below rather than re-explaining process here.

## Scope

All gear-related work lives here: inventory site, tutorials, FAQs, manual PDFs,
cheat sheets, signal-flow diagrams, loan/purchase logs, reviews, personal notes.
Grow structure only when content arrives. For new content, ask: *"website, or
private notes?"* — that decides where it lands.

## Live deliverable

- **Live:** <https://27plus-gear.netlify.app/equipment.html>
- **GitHub:** `center8336/27plus-gear` (main branch)
- **Folder:** `~/iCloud Drive/my hip hop/All-About-GEAR/`
- **Tokens:** `.env` — `GITHUB_PAT`, `NETLIFY_TOKEN`, `NETLIFY_SITE_ID`, `GITHUB_REPO`, `NETLIFY_BUILD_HOOK`

## Skills — task-specific SOPs

When a task matches, **read the skill file before acting**. Each is small and
focused; loading one doesn't cost you the others.

| Task | Skill |
|---|---|
| Add an item | `skills/add-gear-item.md` |
| Remove an item | `skills/remove-gear-item.md` |
| Mark on loan / returned | `skills/mark-on-loan.md` |
| Add a whole new section | `skills/new-section.md` |
| Mobile QA after a deploy | `skills/mobile-qa.md` |
| Sync from Apple Note "器材表" | `skills/sync-from-apple-note.md` |

## Request format (compact)

Users may send edits in a 3-symbol shorthand. All three apply to the
`SECTIONS` array in `equipment.html`:

```
+ Section: Brand Model — Meta description    (add)
- Section: Brand Model                       (remove — confirm first)
~ Section: Brand Model → onLoan: true/false  (modify)
```

Free-form prose ("UA Apollo is back from the loan") is fine too — translate
into the same operations.

## Mobile QA (mandatory)

Every change to `equipment.html` requires both desktop and mobile viewport
check before declaring done. Follow `skills/mobile-qa.md`.

## Deploy workflow

From the project folder:
```bash
./deploy.sh "commit message"
```
Stages only `equipment.html`, commits, pushes to GitHub `main`, pings the
Netlify build hook from `.env`. Deploy is live in ~30s.

## Design system

Colors and typography come from the music-wellness design system v6.1. The
`:root` block in `equipment.html` is the canonical copy — any new HTML page
in this project must inherit it verbatim. See PERIMETRON-style editorial nav,
Syne/Space Grotesk/Space Mono stack, viewport-fit=cover, WCAG AA, motion-safe.

## Related project (do not mix)

The music-wellness research project lives at `~/Mirror/創業/創業/` and deploys
to a different Netlify site. Completely separate — do not push gear files
there. Cross-reference only the design system.
