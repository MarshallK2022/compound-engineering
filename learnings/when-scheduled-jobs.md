# When Building Scheduled Jobs

Check these before writing cron jobs, launchd tasks, or background workers.

## Timeout Every External Call

Background jobs have no user to notice hangs:

```javascript
// BAD - hung for 13+ hours, blocked all subsequent runs
const response = await fetch(API_URL);

// GOOD - always timeout
const controller = new AbortController();
const timeout = setTimeout(() => controller.abort(), 60000);
// ... (see when-http-calls.md for full pattern)
```

## Auth Before Paid Calls

Verify connectivity before spending money:

```javascript
// BAD - 2,880 wasted OpenAI calls over 10 days
async function run() {
  const aiResult = await openai.search();     // $$ runs first
  const events = await calendar.getEvents();  // auth fails after
}

// GOOD - cheap check gates expensive call
async function run() {
  const events = await calendar.getEvents();  // auth check
  const aiResult = await openai.search();     // $$ only if auth works
}
```

## Constrain Frequency

Ask: "When would this output actually be useful?"

```bash
# launchd time guard (macOS)
hour=$(date +%H)
if [ $hour -ge 7 ] && [ $hour -lt 20 ]; then
  /path/to/job
fi

# Weekday only
dow=$(date +%u)
if [ $dow -le 5 ]; then ...
```

Impact: 24/7 job at 5min interval = 288 runs/day. Business hours only = 156/day (46% reduction).

## Graceful Failure

One failure shouldn't break the whole run:

```javascript
// BAD - throws, entire job fails
const result = await riskyCall();
processResult(result);

// GOOD - continue with partial results
const result = await riskyCall().catch(() => null);
if (result) processResult(result);
```
