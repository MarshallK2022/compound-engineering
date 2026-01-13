# Compound Engineering Additions for CLAUDE.md

**Instructions:** Append the content below to your existing `~/.claude/CLAUDE.md` file.

---

# Compound Engineering

## Before Writing Code: Task-Triggered Checklists

**Identify the task type, check only the relevant checklist:**

| If you're doing this... | Check this file |
|-------------------------|-----------------|
| Writing innerHTML or template strings | `~/.claude/learnings/when-html-in-js.md` |
| Making fetch() or API calls | `~/.claude/learnings/when-http-calls.md` |
| Processing/analyzing text | `~/.claude/learnings/when-text-processing.md` |
| Building scheduled/background jobs | `~/.claude/learnings/when-scheduled-jobs.md` |
| Working on Chrome extension | `~/.claude/learnings/when-chrome-extension.md` |
| Designing API endpoints | `~/.claude/learnings/when-api-design.md` |
| Classifying/categorizing entities | `~/.claude/learnings/when-classification.md` |

**Example:**
```
Task: Add upgrade modal to popup.js (Chrome extension, uses innerHTML)
Checking: when-chrome-extension.md, when-html-in-js.md
Applying: HTML entities for special chars, pass constants via args
```

Multiple checklists may apply. Check all relevant ones. Skip if none match.

## Automated Enforcement

Pre-commit hook catches automatable patterns:
- Raw Unicode in JS strings (em-dash, multiplication sign) - **blocks commit**
- fetch() without timeout - warning
- textContent with HTML entities - warning

Install: `ln -sf ~/.claude/learnings/hooks/pre-commit .git/hooks/pre-commit`

## Capture New Learnings

When you fix a bug or make an architectural decision, offer to capture:

Say: "Worth capturing this [bug fix / decision / pattern]? (`/capture`)"

Capture immediately - context is fresh. Don't batch for later.

**After compression**: Only ask "The previous session had [X] - was that captured?" as a safety check.

## Learning Commands

- `/capture` - Save new learnings (bugs, architecture, patterns)
- `/review` - Review code against learnings
- `/patterns` - Show accumulated learnings

## Learnings Structure

```
~/.claude/learnings/
├── index.md              # Overview + quick reference
├── when-html-in-js.md    # Task checklist
├── when-http-calls.md    # Task checklist
├── when-*.md             # Other task checklists
├── hooks/
│   └── pre-commit        # Automated enforcement
├── bugs.md               # Archive: bug patterns with context
├── architecture.md       # Archive: design decisions
└── code-review.md        # Archive: review checklist
```

**Task checklists** = quick checks before writing code (20-40 lines each)
**Archive files** = detailed reference when you need full context

## Cross-Domain Thinking

Many learnings are universal patterns in technology-specific clothing:
- "Timeout external calls" applies to JS fetch, PHP file_get_contents, Python requests
- "Multi-signal classification" applies to domains, users, content, any entity
- "Sanitize before analysis" applies to RSS, HTML, JSON, any text processing

When capturing learnings, identify the **abstract pattern** that transcends the specific technology.

## 6am Wisdom Import (Optional - WUWT Users)

On the **first session after 6am**, check for new reading wisdom to import:

1. **Read** `~/Downloads/wuwt-wisdom-export.json` (if it exists)
2. **Read** `~/.claude/wisdom-processed.json` to see which IDs were already processed
3. **For each unprocessed item**, evaluate if it applies to engineering
4. **If applicable**, offer to capture it
5. **Update** `~/.claude/wisdom-processed.json` with processed IDs

Only do this check once per day (after 6am).
