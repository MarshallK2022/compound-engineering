---
description: "Capture an engineering learning"
---

Capture learnings from our recent work.

**First, analyze the session for learnings:**
1. Look for MULTIPLE lessons - there's often more than one
2. Prioritize by impact: Architecture/strategic decisions > Bug patterns > Code review insights
3. The biggest lesson is usually "why did we end up here?" not "what did we fix?"

**For each learning, ask me:**
1. **Category**: Bug fix, Architecture decision, or Code review insight?
2. **One-line summary**: What's the pattern?
3. **Abstract pattern**: What universal principle does this represent? (e.g., "multi-signal classification", "defensive timeouts", "sanitize before analysis")
4. **Context**: What triggered this learning?
5. **Application**: When should this be applied in future? (Think cross-domain!)

Present the most impactful learning first. After I confirm, ask if there are additional learnings to capture.

**Then append to the appropriate file in ~/.claude/learnings/:**
- bugs.md for bug fixes
- architecture.md for architectural decisions
- code-review.md for review insights

**Format as:**
## [DATE]: [One-line summary]
**Context:** [What triggered this]
**Pattern:** [The actual learning]
**Abstract principle:** [Universal pattern name]
**Apply when:** [Future application - think broadly across technologies]

---

**Update ~/.claude/learnings/index.md:**
1. Add to the appropriate **Universal Patterns** section if it's a cross-domain principle
2. Add to **By Technology** section if technology-specific
3. Include reference to detailed file (e.g., "bugs.md: timeout pattern")

The goal is compound wisdom: a lesson learned in PHP should inform future JavaScript, a pattern from Chrome extensions should apply to VS Code extensions.
