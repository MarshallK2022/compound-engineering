# Bug Patterns

Specific bugs encountered and their fixes, with code examples.

---

_Use `/capture` to add new bug patterns here._

<!-- Example format:
## 2025-01-10: Fetch timeout missing

**Context:** Background job hung indefinitely when API was unresponsive

**Pattern:** Always add timeout to fetch calls
```javascript
// Before (bad)
const response = await fetch(url);

// After (good)
const controller = new AbortController();
const timeout = setTimeout(() => controller.abort(), 30000);
const response = await fetch(url, { signal: controller.signal });
clearTimeout(timeout);
```

**Abstract principle:** Defensive timeouts

**Apply when:** Any external HTTP call, especially in background jobs
-->
