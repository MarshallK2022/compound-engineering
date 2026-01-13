# When Processing Text/Content

Check these before analyzing, extracting, or transforming text content.

## Sanitize Before Analysis

Never assume content is plain text. RSS/HTML content needs cleaning:

```php
// BAD - HTML artifacts appear in results
$terms = extractKeywords($articleContent);
// Result: ["https", "class", "href", "width"] ❌

// GOOD - sanitize first
$text = strip_tags($text);
$text = preg_replace('/https?:\/\/[^\s]+/', '', $text);
$text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
$terms = extractKeywords($text);
```

## Broad Patterns Beat Specific Phrases

When detecting AI failures, user intent, or content types:

```javascript
// BAD - plays whack-a-mole
const patterns = [
  /cannot provide meaningful analysis/i,
  /cannot provide proper analysis/i,
  /cannot provide full analysis/i,
  // ... endless variations
];

// GOOD - catch common prefixes
const patterns = [
  /cannot provide.*(meaningful|proper|full)?\s*analysis/i,
  /this page contains no /i,  // catches "no actual content", "no article", etc.
  /I cannot properly analyze/i,
];
```

## Strip Tracking Parameters at Output

Before sharing/exporting URLs:

```javascript
function stripTracking(url) {
  const urlObj = new URL(url);
  for (const key of [...urlObj.searchParams.keys()]) {
    if (key.startsWith('utm_') ||
        ['fbclid', 'gclid', 'ref', 'mc_cid', 'mc_eid'].includes(key)) {
      urlObj.searchParams.delete(key);
    }
  }
  return urlObj.toString();
}
```

## Citation vs Destination URLs

When AI web search finds entities to link:

```
// In prompt:
Output the entity's OWN URL (their homepage, their paper)
NOT the citation URL where you learned about them

Good: https://xero.com (competitor's site)
Bad: https://thebrandhopper.com/intuit-competitors (citation)
```
