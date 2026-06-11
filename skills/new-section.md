# Skill: Add a new section

Use when: user wants a whole new category of gear (e.g. "add Drums section").

## Steps

1. Pick the section's properties:
   - `id` — short kebab-case identifier (`'drums'`, `'guitar'`, `'modular'`). Becomes the URL fragment for nav.
   - `nav` — short Title Case label for the nav bar (`'Drums'`, `'Guitar'`, `'Modular'`). Keep ≤8 chars to fit mobile.
   - `title` — full section heading, Title Case (`'Drums'`, `'Guitar / Bass'`). Can be longer.
   - `cjk` — Chinese label with single-space padding (`'鼓 組'`, `'吉 他'`). Two-character minimum, four max.
   - `accent` — color number 1–8:
     - `1` rose · `2` peach · `3` sand · `4` sage · `5` sky · `6` lilac · `7` purple-deep · `8` purple-light
     - Reuse a color if already at 8 sections — adjacent sections should differ.

2. Insert the new section object into the `SECTIONS` array at the desired position. Section ordering in the array determines the section number (01, 02, …) and the nav order.

3. Add at least one item, otherwise the section renders as an empty grid:
   ```js
   {
     id: 'drums', nav: 'Drums', title: 'Drums', cjk: '鼓 組', accent: 5,
     items: [
       { name: 'Pearl Masters Maple', meta: '5-Piece Kit' },
     ]
   },
   ```

4. Run `./deploy.sh "Sections: add Drums (#05, accent: sky)"`.

5. Verify the new section appears in nav and renders correctly at both desktop and mobile (see `skills/mobile-qa.md`).

## When sections exceed 8

The accent CSS only defines colors 1–8. If you need a 9th:
- Either re-use one (least disruptive)
- Or add `.section[data-accent="9"] .section-num { color: var(--...); }` to the `<style>` block — pick from the spectrum colors not currently leading visual weight.
