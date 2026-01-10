# Compound Engineering for Claude Code

A system for accumulating engineering wisdom across coding sessions. Learn once, apply forever.

## What This Does

- **Captures learnings** from bug fixes, architectural decisions, and code reviews
- **Cross-domain patterns** - a lesson in JavaScript informs future Python work
- **Learning by analogy** - wisdom from non-code reading (articles, books) can inform engineering patterns
- **Automatic checking** - Claude checks learnings before writing code
- **WUWT Integration** - Import wisdom from your reading (if using What's Up With That? extension)

## Quick Setup

```bash
# Clone to a temp directory
git clone https://github.com/YOUR_USERNAME/compound-engineering ~/.claude/compound-engineering-temp

# Copy files
cp -r ~/.claude/compound-engineering-temp/commands ~/.claude/
cp -r ~/.claude/compound-engineering-temp/learnings ~/.claude/
cp ~/.claude/compound-engineering-temp/wisdom-processed.json ~/.claude/

# Append compound engineering instructions to your CLAUDE.md
# (The file has instructions at the top - copy everything below the --- line)
cat ~/.claude/compound-engineering-temp/CLAUDE-additions.md >> ~/.claude/CLAUDE.md

# Clean up
rm -rf ~/.claude/compound-engineering-temp
```

**Note:** If you don't have a `~/.claude/CLAUDE.md` yet, create one first or just copy the additions file directly.

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
    ├── index.md                # Quick reference (start here)
    ├── bugs.md                 # Bug patterns with code
    ├── architecture.md         # Design decisions
    └── code-review.md          # Review checklists
```

## Usage

### Capture a Learning

After fixing a bug or making an architectural decision:

```
/capture
```

Claude will:
1. Analyze what was learned
2. Ask you to confirm the pattern
3. Save it to the appropriate file
4. Update the index

### View Your Learnings

```
/patterns
```

Shows a summary of accumulated wisdom.

### Review Code Against Learnings

```
/review
```

Reviews current code changes against accumulated patterns. Checks git diff and reports which patterns apply, which were missed, and suggests new patterns to capture.

### Automatic Checking

Claude automatically checks `~/.claude/learnings/index.md` before implementing features. You'll see:

```
Checking learnings...
- "Always timeout external calls" applies - adding AbortController
- No other patterns apply to this change
```

## Learning by Analogy (from Non-Code Reading)

Engineering patterns often hide in non-technical domains:

| Reading | Analogy | Engineering Pattern |
|---------|---------|---------------------|
| Forest ecosystems are resilient through diversity | Redundancy prevents single points of failure | Distributed systems need redundancy |
| Immune systems remember past threats | Cache previous solutions | Memoization, learned indexes |
| River deltas branch to handle variable flow | Split load across channels | Load balancing, sharding |
| Ant colonies use pheromone trails | Leave traces for others to follow | Logging, breadcrumbs, audit trails |

When you encounter wisdom from reading - articles, books, conversations - ask: **"What engineering pattern does this represent?"**

### WUWT Integration (Optional)

If you use the "What's Up With That?" Chrome extension for reading:

1. Enable "Claude Code" toggle in the Wisdom section when saving lessons
2. Wisdom from your reading exports to `~/Downloads/wuwt-wisdom-export.json`
3. Claude checks this daily (after 6am) and evaluates each item:
   - **Literal match**: Directly about software/engineering → offer to capture
   - **Metaphor potential**: Pattern from another domain → propose the analogy, then offer to capture

Example:
```
I found wisdom from your reading:
"APIs should be designed for machine readability in the age of AI"
(from: "The Future of Developer Tools")

This directly applies to engineering. Want me to /capture it?
```

Or:
```
I found wisdom from your reading:
"Successful communities have clear boundaries but permeable membranes"
(from: "The Art of Gathering")

This could apply to engineering as: "APIs should have clear contracts (boundaries)
but flexible input handling (permeable membranes)"

Want me to /capture this analogy?
```

## Philosophy

**Compound wisdom**: Every bug fixed, every architectural decision made, every insight from reading becomes part of your permanent engineering knowledge.

**Cross-domain thinking**: Patterns transcend technology. "Timeout external calls" applies to JavaScript fetch, Python requests, PHP file_get_contents, Go http.Client. "Resilience through redundancy" applies to distributed systems, team structures, and backup strategies.

**Analogical reasoning**: The best engineers see patterns across domains. A lesson from biology, economics, or urban planning might be the insight that solves your hardest technical problem.

**Learn once, apply forever**: The learnings file grows over time. Claude checks it before every implementation.

## Contributing

Found a universal pattern? Submit a PR to the `learnings/` directory.

## License

MIT
