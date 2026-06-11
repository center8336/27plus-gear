# Skill: Remove a gear item

Use when: user says "X is sold" / "X is gone" / sends `- Section: Name`.

## Steps

1. **Confirm with user first** — removal is destructive. Echo back the name + reason (sold? gifted? broken?) and ask before proceeding. (Hung-Yi's "Human-in-the-Loop" principle.)
2. Open `equipment.html`, locate the `SECTIONS` array.
3. Find the section, locate the item's `{ name: '...', meta: '...' }` line.
4. Delete the whole object literal (including trailing comma).
5. **Do not** renumber anything — counts auto-render.
6. Run `./deploy.sh "Toy: remove TE CM-15 (sold)"` — include the reason in the commit message for the git log.
7. Verify the section's total count decremented at the live URL.

## When NOT to remove

- Item is **on loan**, not sold → use `skills/mark-on-loan.md` (set `onLoan: true`) instead.
- Item is **temporarily broken / being repaired** → consider an `onLoan`-style flag with `meta` annotation like `'Cardioid Dynamic — in repair'`, not removal.

The data array is the historical record only while items exist in it; for a real ownership-history trail, see `notes/purchase-log.md` (when you start one).
