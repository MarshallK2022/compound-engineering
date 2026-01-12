---
description: "Suggest technical reading based on your learnings"
---

Generate a personalized reading list based on accumulated learnings and reading wisdom.

**1. Analyze the user's knowledge:**

Read these files:
- @~/.claude/learnings/index.md (engineering patterns)
- @~/.claude/learnings/bugs.md (recent bug patterns)
- @~/.claude/learnings/architecture.md (design decisions)
- ~/Downloads/wuwt-wisdom-export.json (reading wisdom, if exists)

**2. Identify themes and gaps:**

- What patterns appear repeatedly?
- What domains is the user working in?
- What concepts from reading wisdom could be deepened?
- Where are there related topics the user hasn't explored?

**3. Search for relevant technical articles:**

Use web search to find 3-5 articles that:
- Deepen understanding of captured patterns
- Connect related concepts across domains
- Fill knowledge gaps
- Come from reputable sources (official docs, respected blogs, academic papers)

**4. Present the reading list:**

Format as:

```
## Your Learning Themes
- [Theme 1]: X learnings captured
- [Theme 2]: Y learnings captured

## Suggested Reading

### To deepen [Theme 1]:
1. **[Article Title]** - [Source]
   Why: [How it connects to their specific learnings]
   Link: [URL]

### To explore related concepts:
2. **[Article Title]** - [Source]
   Why: [What gap or connection this addresses]
   Link: [URL]

### From your reading wisdom:
3. **[Article Title]** - [Source]
   Why: [How it builds on wisdom they've already captured]
   Link: [URL]
```

**5. Offer to track:**

Ask: "Want me to save any of these to check later?"

The goal is compound learning: coding informs reading, reading informs coding.
