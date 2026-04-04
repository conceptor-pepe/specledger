# Adoption

## Minimum Adoption Path

1. Add `changes/`, `specs/`, and `templates/` to your repository.
2. Start requiring a change folder for high-risk work.
3. Add workflow rules and command adapters for the AI tools your team uses.
4. Add verification scripts and CI gates.
5. Gradually move from documentation-only enforcement to script-backed enforcement.

## Brownfield Recommendation

Do not migrate every existing feature at once.

Start with:

- API changes
- schema changes
- cross-module work
- high-risk transactional logic

Then expand once the team is comfortable with the artifact lifecycle.
