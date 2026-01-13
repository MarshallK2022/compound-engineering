# When Writing HTML in JavaScript

Check these before writing innerHTML, template literals, or any JS that generates HTML.

## Encoding-Safe Rendering

**Use HTML entities, not raw Unicode characters.**

```javascript
// BAD - may render as garbled characters
innerHTML = `<button>×</button>`;     // × may become Ã—
innerHTML = `<span>—</span>`;         // — may become â€"

// GOOD - HTML entities
innerHTML = `<button>&times;</button>`;
innerHTML = `<span>&mdash;</span>`;
```

Common substitutions:
| Want | Entity | CSS Alternative |
|------|--------|-----------------|
| × | `&times;` | - |
| — | `&mdash;` | - |
| → | `&rarr;` | - |
| ▼ | `&#9660;` | CSS border triangle |
| ▲ | `&#9650;` | CSS border triangle |

## CSP Blocks Inline Handlers

If injecting into pages with Content Security Policy:

```javascript
// BAD - blocked by CSP
innerHTML = `<button onclick="doThing()">`;
innerHTML = `<div style="color: red">`;

// GOOD - external files or programmatic
element.addEventListener('click', doThing);
element.classList.add('error-text');
```

## Injected Functions Can't Access Parent Scope

Functions injected via `executeScript` run in page context:

```javascript
// BAD - LAST_UPDATED undefined in page context
function displayResults() {
  const date = LAST_UPDATED;  // ❌ breaks
}

// GOOD - pass as parameter
chrome.scripting.executeScript({
  function: displayResults,
  args: [LAST_UPDATED]
});
function displayResults(lastUpdated) { ... }
```
