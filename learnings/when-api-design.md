# When Designing APIs/Workers

Check these before building API endpoints or proxy workers.

## Instrument Day 1

Before any external users, implement:

| Requirement | Purpose |
|-------------|---------|
| User identification | Know who's making requests |
| Usage counting | Track requests per user per period |
| Rate limiting | Prevent runaway costs |
| Kill switch (blocklist) | Disable abusive users instantly |
| Admin visibility | Usage reports |

```javascript
// Every request
const userEmail = request.headers.get('X-User-Email');
if (await isBlocked(userEmail)) return error(403, 'BLOCKED');
if (await isOverQuota(userEmail)) return error(429, 'QUOTA_EXCEEDED');
// ... proxy request ...
await incrementUsage(userEmail, feature);
```

## Gate at Entry

Check authorization once at the boundary, then trust internal operations:

```javascript
// BAD - distributed checks
analyzeButton() { if (!paid) block(); }
simplifyButton() { if (!paid) block(); }
chatButton() { if (!paid) block(); }

// GOOD - single gate
analyzeButton() {
  if (quotaExhausted()) block();  // only gate
}
simplifyButton() { /* always allowed after analysis */ }
```

## User-Local Time for Daily Quotas

```javascript
// Client sends timezone
headers['X-Timezone'] = Intl.DateTimeFormat().resolvedOptions().timeZone;

// Server computes local date
function getDateKey(timezone) {
  const formatter = new Intl.DateTimeFormat('en-CA', {
    timeZone: timezone,
    year: 'numeric', month: '2-digit', day: '2-digit'
  });
  return formatter.format(new Date()); // "2026-01-12"
}
```

Users expect "tomorrow" to mean their tomorrow.

## Optional Params Need Valid Defaults

If a default affects auth/routing/behavior, it must be a valid value:

```javascript
// BAD - 'unknown' fails server-side checks
function callAPI(feature = 'unknown') { ... }

// GOOD - default is explicitly handled
function callAPI(feature = 'default') { ... }
```
