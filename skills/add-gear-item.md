# Skill: Add a gear item

Use when: user says "add X" or sends a `+ Section: Name — Meta` line.

## Steps

1. Open `equipment.html`, locate the `SECTIONS` array (top of `<body>`).
2. Find the right section by its `title` or `id` (e.g. `id: 'mics'`).
3. Insert a new line inside that section's `items: [...]` array:
   ```js
   { name: 'Name Here', meta: 'Description / Type' },
   ```
4. Conventions for the two fields:
   - `name` — the brand + model, plain (e.g. `'Neumann U87 ai'`).
   - `meta` — short type description, Title Case (e.g. `'Large-Diaphragm Condenser'`, `'Tube Condenser'`, `'Cardioid Dynamic'`).
5. Decide position by like-with-like:
   - Mics — condensers first, then dynamics, then specialty (shotgun, etc.).
   - Monitoring — speakers first, then headphones.
   - Otherwise: end of list is fine.
6. **Do not** edit any `01 / 07`-style indices — they auto-render from array length.
7. Run `./deploy.sh "Mics: add Nordic Audio Labs NU-100K"` (or similar).
8. Verify at <https://27plus-gear.netlify.app/equipment.html> after ~30s.

## Edge cases

- New brand never seen before → keep `meta` short and consistent with neighbors.
- Item belongs to a section that doesn't exist yet → use `skills/new-section.md` first.
- Item is on loan from the day it arrives → add `onLoan: true` per `skills/mark-on-loan.md`.
