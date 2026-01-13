# When Building Classification Systems

Check these before writing code that categorizes entities.

## Multi-Signal Beats Single-Signal

Combine all available metadata:

```php
// BAD - only checks domain name
$textToSearch = strtolower($domain);

// GOOD - combines all signals
$textToSearch = strtolower(
    $domain . ' ' .        // domain name
    $linkText . ' ' .      // anchor text from source
    $siteName . ' ' .      // og:site_name
    $siteDescription       // meta description
);
```

## Order Rules Specific to General

```php
// Order matters:
1. TLD checks (.gov, .edu, .org)     // most specific
2. Exact domain matches              // known entities
3. Keyword in domain                 // broad patterns
4. Keyword in metadata               // broadest
5. Default category                  // fallback
```

## Store Signals for Re-classification

```php
// Store raw signals, not just final category
$record = [
    'domain' => $domain,
    'site_name' => $siteName,
    'description' => $description,
    'category' => $computedCategory,
    'classified_at' => time()
];
// Can re-run classification without re-fetching
```

## Harvest Metadata as Byproduct

Extract discovery data during normal processing:

```
Input Data → Primary Analysis → Output
     ↓
  Extract metadata (domains, authors, keywords)
     ↓
  Track "all seen" + "newly discovered"
     ↓
  User reviews queue → finds new sources
```

Two-file pattern: `all_domains.json` (history) + `new_domains.json` (action queue)
