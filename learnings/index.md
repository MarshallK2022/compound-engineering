# Engineering Learnings Index

Quick reference of accumulated compound knowledge. **Scan this before writing code.**

## Universal Patterns (apply across domains)

### Defensive Programming
- **Always timeout external calls** - AbortController/timeout on every HTTP request, especially background jobs
- **Validate at boundaries only** - Trust internal code, validate user input and external APIs
- **Fail gracefully** - Return null/empty vs throwing when one failure shouldn't break the whole flow

### Classification & Detection
- **Multi-signal beats single-signal** - Combine all available metadata for entity classification
- **Order rules specific→general** - TLD checks before keyword matches, exact matches before fuzzy

### Data Processing
- **Sanitize before analysis** - strip_tags, decode entities, remove URLs before NLP/text analysis

### API Integration
- **Extract error messages properly** - API errors are often `{error: {message: "..."}}` not strings

---

## By Technology

### (Add technology-specific patterns here)
_Example: FreshRSS, Chrome Extensions, AI APIs, etc._

---

## Detailed Entries
- **bugs.md** - Specific bug patterns with code examples
- **architecture.md** - System design decisions with rationale
- **code-review.md** - Checklist items for reviewing code
