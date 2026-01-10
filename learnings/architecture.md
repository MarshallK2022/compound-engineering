# Architecture Decisions

System design decisions with rationale.

---

_Use `/capture` to add new architecture decisions here._

<!-- Example format:
## 2025-01-10: Auth before paid calls

**Context:** Scheduled job was making paid API calls before checking auth

**Pattern:** In scheduled jobs, verify auth/connectivity before making paid API calls; fail fast, fail cheap

**Abstract principle:** Gate at entry

**Apply when:** Any workflow that has both authentication and paid/expensive operations
-->
