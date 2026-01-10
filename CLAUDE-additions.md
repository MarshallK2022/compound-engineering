# Compound Engineering Additions for CLAUDE.md

**Instructions:** Append the content below to your existing `~/.claude/CLAUDE.md` file.

---

# Compound Engineering

## MANDATORY: Check Learnings Before Writing Code

**Before implementing ANY feature, fix, or modification, you MUST:**

1. **Read `~/.claude/learnings/index.md`** using the Read tool
2. **Scan Universal Patterns** for applicable learnings (timeouts, classification, data processing, etc.)
3. **Check technology-specific section** if relevant to your stack
4. **State which patterns apply** (or "none applicable") before proceeding

This is not optional. Accumulated learnings prevent repeated mistakes and compound engineering wisdom.

Example before writing code:
```
Checking learnings...
- "Always timeout external calls" applies - adding AbortController
- "Multi-signal classification" applies - will use site_name + description
- No technology-specific patterns apply to this change
```

## Capture New Learnings

When fixing bugs or making architectural decisions, proactively offer to capture using `/capture`:
- Bug patterns → bugs.md
- Design decisions → architecture.md
- Review insights → code-review.md

**Ask:** "Should we capture this as a learning?"

## Learnings Files

- `~/.claude/learnings/index.md` - **Start here** - Universal patterns + technology index
- `~/.claude/learnings/bugs.md` - Bug patterns with code examples
- `~/.claude/learnings/architecture.md` - System design decisions with rationale
- `~/.claude/learnings/code-review.md` - Checklist items for reviewing code

## Cross-Domain Thinking

Many learnings are universal patterns in technology-specific clothing:
- "Timeout external calls" → applies to JS fetch, PHP file_get_contents, Python requests
- "Multi-signal classification" → applies to domains, users, content, any entity
- "Sanitize before analysis" → applies to RSS, HTML, JSON, any text processing

When capturing learnings, identify the **abstract pattern** that transcends the specific technology.

## 6am Wisdom Import (Optional - WUWT Users)

At the start of each day (after 6am), check for wisdom from reading:

1. Check if `~/Downloads/wuwt-wisdom-export.json` exists and has new items
2. Read `~/.claude/wisdom-processed.json` to see which items have been processed
3. For each new item, evaluate:
   - **Literal match**: Directly about software/engineering → offer to `/capture`
   - **Metaphor potential**: Pattern from another domain → propose the analogy, ask if user wants to `/capture`
4. Update `~/.claude/wisdom-processed.json` with processed item IDs

Example:
```
I found wisdom from your reading:
"Successful communities have clear boundaries but permeable membranes"
(from: "The Art of Gathering")

This could apply to engineering as: "APIs should have clear contracts (boundaries)
but flexible input handling (permeable membranes)"

Want me to /capture this analogy?
```
