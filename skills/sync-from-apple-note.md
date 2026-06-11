# Skill: Sync from Apple Note "器材表"

Use when: user says "sync from the note" / "update from 器材表" / has done a batch of edits in the Apple Note.

The Apple Note is the canonical source of truth for what gear exists. The `SECTIONS` array in `equipment.html` is a *projection* of that note for the website. This skill is the distillation step (Hung-Yi: knowledge distillation pattern).

## Steps

1. Read the current note via osascript helper:
   ```
   ./scripts/read-apple-note.sh
   ```
   Output is raw HTML body of the note.

2. Parse the HTML mentally (or pipe through a parser later if it grows):
   - Section headings (e.g. `Microphones`, `Monitoring`) map to `SECTIONS[i].title`.
   - Bullet items become `{ name, meta }` objects. The brand+model line goes into `name`; if there's a type/description, that's `meta`.
   - Strikethrough text (`<s>...</s>` or `<strike>`) or trailing `(出借中)` → `onLoan: true`.

3. Map note section names (often mixed EN/中文) to current `SECTIONS` ids:
   | Note heading | SECTIONS id |
   |---|---|
   | Mic Pre | `mic-pre` |
   | Microphones | `mics` |
   | Recording/Interface | `interface` |
   | Monitoring | `monitoring` |
   | Sampler/Effect/Pedal | `fx` |
   | 影像合成器 / Video Synth | `visual` |
   | MIDI | `midi` |
   | tiny toys / 小玩具 / Toy | `toy` |

4. Diff against current `SECTIONS`. Produce three lists:
   - **Added** — in note, not in code
   - **Removed** — in code, not in note
   - **Status changed** — `onLoan` flag differs

5. **Present the diff to the user, do not auto-apply** (Human-in-the-Loop). Format:
   ```
   + Mics: Nordic Audio Labs NU-100K — Large-Diaphragm Condenser
   - Toy: Teenage Engineering CM-15
   ~ Interface: UA Apollo Twin X Duo → onLoan: false (returned)
   ```

6. On user approval, apply each change using the relevant skill (`add-gear-item`, `remove-gear-item`, `mark-on-loan`).

7. Single combined commit: `./deploy.sh "Sync from Apple Note (YYYY-MM-DD)"`.

## When the parser becomes worth building

If you start syncing more than ~once a month and the diffs are routinely 5+ items, replace step 2 with a Python script that emits structured JSON. Until then, manual diff is fine — note size is small enough.

## Read the note (helper)

The script lives at `scripts/read-apple-note.sh`. It uses osascript:

```bash
#!/bin/bash
osascript <<'EOF'
tell application "Notes"
  set noteContent to body of (first note whose name is "器材表")
  return noteContent
end tell
EOF
```

Output is the note's HTML body — usable as-is for human reading and parser-ready for future automation.
