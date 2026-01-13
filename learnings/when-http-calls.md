# When Making HTTP Calls

Check these before writing fetch(), XMLHttpRequest, or any external API call.

## Always Use Timeout

Every external call needs a timeout. No exceptions.

```javascript
// BAD - can hang forever
const response = await fetch(url);

// BAD - timeout option doesn't exist in fetch spec
const response = await fetch(url, { timeout: 5000 });

// GOOD - AbortController
const controller = new AbortController();
const timeout = setTimeout(() => controller.abort(), 60000);
try {
  const response = await fetch(url, { signal: controller.signal });
  clearTimeout(timeout);
} catch (error) {
  clearTimeout(timeout);
  if (error.name === 'AbortError') { /* handle timeout */ }
}
```

Timeout guidelines:
- AI APIs: 60s
- File uploads: 60s
- File downloads: 30s
- Page crawls: 15s per page
- Internal services: 10s

## Extract Error Messages Properly

API errors are often objects, not strings:

```javascript
// BAD - shows [object Object]
throw new Error(errorData.error);

// GOOD - handle both string and object
const errorMessage = typeof errorData.error === 'string'
  ? errorData.error
  : (errorData.error?.message || `API Error: ${response.status}`);
```

## Auth Before Paid Calls

In jobs combining auth + paid APIs, verify auth first:

```javascript
// BAD - wastes money if auth broken
const aiResult = await openai.search();  // $$
const events = await calendar.getEvents(); // may throw

// GOOD - fail fast, fail cheap
const events = await calendar.getEvents(); // auth check
const aiResult = await openai.search();    // $$ only if auth works
```

## Use Model Aliases

```javascript
// BAD - may 404
model: 'claude-haiku-4-5-20241022'

// GOOD - always works
model: 'claude-haiku-4-5'
```
