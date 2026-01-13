# When Building Chrome Extensions

Check these before writing extension code.

## Injected Functions Are Isolated

Functions run via `executeScript` can't access:
- Chrome APIs (`chrome.runtime`, `chrome.storage`)
- Module-scoped constants
- Imported modules

```javascript
// BAD
function displayResults() {
  const v = chrome.runtime.getManifest().version; // ❌ undefined
  const d = LAST_UPDATED; // ❌ undefined
}

// GOOD - pass via args
chrome.scripting.executeScript({
  function: displayResults,
  args: [chrome.runtime.getManifest().version, LAST_UPDATED]
});
```

## On-Demand Injection Reduces Permissions

```javascript
// BAD manifest.json - scary permission warning
"content_scripts": [{ "matches": ["<all_urls>"] }]

// GOOD - inject when user clicks
// background.js
chrome.action.onClicked.addListener(async (tab) => {
  await chrome.scripting.executeScript({
    target: { tabId: tab.id },
    files: ['content.js']
  });
});
```

Result: "read and change all data" → just "activeTab"

## Guard Against Duplicate Injection

```javascript
// content.js
if (window._myExtensionLoaded) return;
window._myExtensionLoaded = true;
// ... rest of script
```

## Optional Parameters Need Valid Defaults

```javascript
// BAD - 'unknown' not in FREE_FEATURES list, breaks quota
async function callAPI(body, feature = 'unknown') { ... }

// GOOD - default is a known-valid value
async function callAPI(body, feature = 'default') { ... }
// Server: FREE_FEATURES = ['default', ...]
```
