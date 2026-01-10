# Code Review Checklist

Items to check when reviewing code.

---

_Use `/capture` to add new review insights here._

## General Checklist

- [ ] External calls have timeouts
- [ ] Error messages are extracted properly from API responses
- [ ] Input validation happens at boundaries, not throughout
- [ ] No sensitive data in logs or error messages
- [ ] Graceful degradation when one component fails

## Before Merging

- [ ] Check learnings index for applicable patterns
- [ ] Verify no OWASP Top 10 vulnerabilities introduced
- [ ] Consider cross-domain applicability of any new patterns
