# Compound Engineering for Claude Code

A system for accumulating engineering wisdom across coding sessions. Learn once, apply forever.

## The Problem

You fix a bug. Next month, you make the same mistake. The knowledge existed - it just wasn't applied.

**Old approach:** Scan a long index before every code change. Easy to skip, inefficient, patterns organized wrong.

**New approach:** Two retrieval paths that match how work actually happens.

## How It Works

### 1. Automated Enforcement (Pre-Commit Hook)

Detectable anti-patterns get caught automatically - no thinking required.

```bash
# Install in any repo
ln -sf ~/.claude/learnings/hooks/pre-commit .git/hooks/pre-commit
```

The hook catches:
| Pattern | Action |
|---------|--------|
| Raw Unicode in JS (em-dash, multiplication sign) | **Blocks commit** |
| fetch() without AbortController | Warning |
| textContent with HTML entities | Warning |

### 2. Task-Triggered Checklists

Before writing code, identify the task type and check only the relevant file:

| Task | Checklist |
|------|-----------|
| Writing innerHTML or template strings | `when-html-in-js.md` |
| Making fetch() or API calls | `when-http-calls.md` |
| Processing/analyzing text | `when-text-processing.md` |
| Building scheduled/background jobs | `when-scheduled-jobs.md` |
| Working on Chrome extension | `when-chrome-extension.md` |
| Designing API endpoints | `when-api-design.md` |
| Classifying/categorizing entities | `when-classification.md` |

Each checklist is ~30-40 lines. Check relevant ones, skip the rest.

**Example:**
```
Task: Add upgrade modal to popup.js (Chrome extension, uses innerHTML)
Checking: when-chrome-extension.md, when-html-in-js.md
Applying: HTML entities for special chars, pass constants via args
```

## Quick Setup

```bash
# Clone to your .claude directory
git clone https://github.com/MarshallK2022/compound-engineering ~/.claude/compound-temp

# Copy files
cp -r ~/.claude/compound-temp/learnings ~/.claude/
cp -r ~/.claude/compound-temp/commands ~/.claude/
mkdir -p ~/.claude/learnings/hooks
cp ~/.claude/compound-temp/hooks/pre-commit ~/.claude/learnings/hooks/
cp ~/.claude/compound-temp/hooks/check-wisdom.sh ~/.claude/hooks/ 2>/dev/null || true
cp ~/.claude/compound-temp/wisdom-processed.json ~/.claude/

# Append to CLAUDE.md (or create it)
cat ~/.claude/compound-temp/CLAUDE-additions.md >> ~/.claude/CLAUDE.md

# Clean up
rm -rf ~/.claude/compound-temp
```

## Directory Structure

```
~/.claude/
├── CLAUDE.md                    # Instructions Claude follows
├── wisdom-processed.json        # Tracks imported reading wisdom
├── commands/
│   ├── capture.md              # /capture skill
│   ├── patterns.md             # /patterns skill
│   └── review.md               # /review skill
└── learnings/
    ├── index.md                # Overview + quick reference
    ├── when-html-in-js.md      # Task checklist
    ├── when-http-calls.md      # Task checklist
    ├── when-text-processing.md # Task checklist
    ├── when-scheduled-jobs.md  # Task checklist
    ├── when-chrome-extension.md# Task checklist
    ├── when-api-design.md      # Task checklist
    ├── when-classification.md  # Task checklist
    ├── hooks/
    │   └── pre-commit          # Automated enforcement
    ├── bugs.md                 # Archive: bug patterns
    ├── architecture.md         # Archive: design decisions
    └── code-review.md          # Archive: review checklist
```

## Usage

### Capture a Learning

After fixing a bug or making an architectural decision:

```
/capture
```

Claude will analyze what was learned, confirm the pattern, and save it appropriately.

### View Your Learnings

```
/patterns
```

Shows a summary of accumulated wisdom.

### Review Code Against Learnings

```
/review
```

Reviews current code changes against accumulated patterns.

## Adding New Learnings

When you discover a pattern:

1. **Does it fit an existing `when-*.md`?** Add it there
2. **Is it a new task type?** Create `when-{task}.md`
3. **Can it be automated?** Add to `hooks/pre-commit`
4. **Need full context?** Add to `bugs.md` or `architecture.md`

## Philosophy

**Task-triggered beats exhaustive scanning.** Check what's relevant to your current task, not everything.

**Automated beats manual.** If a pattern can be detected programmatically, enforce it in the pre-commit hook.

**Compound over time.** Every bug fixed, every architectural decision made becomes part of your permanent engineering knowledge.

**Abstract patterns transcend technology.** "Timeout external calls" applies to JavaScript, Python, Go, PHP. Capture the principle, not just the syntax.

## WUWT Integration (Optional)

If you use the "What's Up With That?" Chrome extension for reading:

1. Enable "Claude Code" toggle when saving wisdom
2. Wisdom exports to `~/Downloads/wuwt-wisdom-export.json`
3. Claude checks once per day and offers to capture relevant learnings

## Contributing

Found a universal pattern? Submit a PR to add it.

## License

MIT
