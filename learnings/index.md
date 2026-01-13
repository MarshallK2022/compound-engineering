# Engineering Learnings

Compound knowledge system. Two retrieval paths: **automated** (pre-commit hooks) and **task-triggered** (checklists).

---

## Quick Start

1. **Install pre-commit hook** in your repo:
   ```bash
   ln -sf ~/.claude/learnings/hooks/pre-commit .git/hooks/pre-commit
   ```

2. **Before writing code**, identify which task you're doing and check the relevant file:

| Task | Checklist |
|------|-----------|
| Writing innerHTML, template strings | `when-html-in-js.md` |
| Making fetch() or API calls | `when-http-calls.md` |
| Processing/analyzing text content | `when-text-processing.md` |
| Building cron/launchd/background jobs | `when-scheduled-jobs.md` |
| Working on Chrome extension | `when-chrome-extension.md` |
| Designing API endpoints or workers | `when-api-design.md` |
| Categorizing/classifying entities | `when-classification.md` |

---

## Automated Enforcement (Pre-Commit Hook)

The hook catches these patterns automatically:

| Pattern | Action |
|---------|--------|
| Raw Unicode in JS (em-dash, multiplication sign) | **Blocks commit** |
| fetch() without AbortController nearby | Warning |
| textContent with HTML entities | Warning |

Errors block commit. Warnings pass but notify.

---

## Task-Triggered Checklists

Small, focused files (~30-40 lines each). Check only what's relevant.

### `when-html-in-js.md`
- Use HTML entities (`&mdash;`) not raw Unicode
- CSP blocks inline handlers - use external files
- Injected functions can't access parent scope

### `when-http-calls.md`
- Always timeout with AbortController
- Extract error messages properly (object vs string)
- Auth before paid calls
- Use model aliases not versioned IDs

### `when-text-processing.md`
- Sanitize before analysis (strip_tags, decode entities)
- Broad patterns beat specific phrases
- Strip tracking params at output
- Citation vs destination URLs

### `when-scheduled-jobs.md`
- Timeout every external call
- Auth before paid calls
- Constrain frequency to useful hours
- Graceful failure (don't break whole run)

### `when-chrome-extension.md`
- Injected functions are isolated (pass via args)
- On-demand injection reduces permissions
- Guard against duplicate injection
- Optional params need valid defaults

### `when-api-design.md`
- Instrument Day 1 (usage, limits, kill switch)
- Gate at entry, trust internal operations
- User-local time for daily quotas
- Optional params need valid defaults

### `when-classification.md`
- Multi-signal beats single-signal
- Order rules specific to general
- Store signals for re-classification
- Harvest metadata as byproduct

---

## Archive (Detailed Reference)

Full context and code examples when you need deeper understanding:

- **bugs.md** - Bug patterns with debugging journey
- **architecture.md** - Design decisions with rationale
- **code-review.md** - Review checklist items

---

## Adding New Learnings

When you fix a bug or make an architectural decision:

1. **Determine where it belongs:**
   - Does it fit an existing `when-*.md` checklist? Add to that file
   - Is it a new task type? Create new `when-{task}.md`
   - Need full context preserved? Add to `bugs.md` or `architecture.md`

2. **Can it be automated?** Add pattern to `hooks/pre-commit`

3. **Extract the abstract principle** - learnings should transcend the specific technology
