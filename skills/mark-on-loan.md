# Skill: Mark an item on loan / returned

Use when: user says "X is loaned out" / "X is back" / sends `~ Section: Name → onLoan: true/false`.

## Steps — going on loan

1. Open `equipment.html`, find the item's line in `SECTIONS`.
2. Add `onLoan: true` as a trailing field:
   ```js
   { name: 'UA Apollo Twin X Duo', meta: 'Thunderbolt Interface', onLoan: true },
   ```
3. Run `./deploy.sh "Interface: UA Apollo Twin X Duo → on loan"`.

## Steps — returned

1. Find the item's line.
2. Remove the `, onLoan: true` segment, leaving:
   ```js
   { name: 'UA Apollo Twin X Duo', meta: 'Thunderbolt Interface' },
   ```
3. Run `./deploy.sh "Interface: UA Apollo Twin X Duo → returned"`.

## What the render does automatically

When `onLoan: true` is present:
- Card opacity drops to 60%
- Item name gets a strikethrough
- Left-edge stripe turns from purple to grey
- A `出借中 · On Loan` badge appears below the meta

No CSS or HTML edits needed — the renderer reads the flag and applies all styling.
