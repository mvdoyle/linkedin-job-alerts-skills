---
name: linkedin-job-search-router
description: Routes natural-language LinkedIn job search requests to standardized C# and .NET search skills. Use when the user asks to find LinkedIn jobs, check C# or .NET roles, search internships, look locally, or run a full sweep.
---

# LinkedIn Job Search Router

## Runtime

Use this through the Claude Code Chrome extension with an authenticated LinkedIn session in the active Chrome profile.

## User Profile

- Stack: C# / .NET
- Career level: Internship, Entry, Associate
- Default sort: Most relevant
- Local market: owned by `linkedin-local-dotnet-search`

## First Step Per Session

1. Open `https://www.linkedin.com/jobs/jam/`.
2. Inventory existing alerts as `{keywords, location, filters, frequency}`.
3. Use that inventory when deciding whether leaf skills should create, update, or skip alerts.

## Routing

| Intent | Skill |
|---|---|
| C# jobs, no internship or local hint | `linkedin-csharp-job-search` |
| C# internships | `linkedin-csharp-internship-search` |
| .NET or dotnet, no local hint | `linkedin-dotnet-job-search` |
| local, near me, on-site, hybrid, commute, home town | `linkedin-local-dotnet-search` |
| generic job search with no stack hint | Ask whether to search remote C#, remote .NET, C# internships, or local .NET. |
| all, everything, full sweep | Run all four leaf skills and dedupe by job ID. |

## Prebuilt Routes

- Remote C# junior: `https://www.linkedin.com/jobs/search/?keywords=c%23&geoId=103644278&f_TPR=r86400&f_E=2%2C3&f_JT=F&f_WT=2&sortBy=R`
- Remote C# internship: `https://www.linkedin.com/jobs/search/?keywords=c%23&geoId=103644278&f_TPR=r86400&f_E=1&f_JT=F&f_WT=2&sortBy=R`
- Remote .NET junior plus contract: `https://www.linkedin.com/jobs/search/?keywords=.net&geoId=103644278&f_TPR=r86400&f_E=1%2C2%2C3&f_JT=F%2CC&f_WT=2&sortBy=R`
- Local .NET: `https://www.linkedin.com/jobs/search/?keywords=.net&geoId=102905961&f_TPR=r604800&f_E=1%2C2%2C3&f_JT=F%2CC&f_WT=1%2C3&sortBy=R`

## URL Parameters

- `geoId`: `103644278` = United States, `102905961` = Birmingham AL
- `f_TPR`: `r86400` = 24h, `r604800` = 7d, `r2592000` = 30d
- `f_E`: `1` = Internship, `2` = Entry, `3` = Associate, `4` = Mid-Senior
- `f_JT`: `F` = Full-time, `C` = Contract, `P` = Part-time
- `f_WT`: `1` = On-site, `2` = Remote, `3` = Hybrid
- `sortBy`: `R` = Most relevant, `DD` = Most recent
- `distance`: miles for local searches

## Override Modifiers

Apply user modifiers to the selected route before navigating:

- newest, latest, most recent: set `sortBy=DD`
- this week, past week: set `f_TPR=r604800`
- this month, past month: set `f_TPR=r2592000`
- include mid-level or senior: append `4` to `f_E`
- no internships: remove `1` from `f_E`
- remote ok on local route: set `f_WT=1,2,3`
- hybrid only: set `f_WT=3`
- on-site only: set `f_WT=1`
- full-time only: set `f_JT=F`
- include part-time: append `P` to `f_JT`
- within N miles: set `distance=N`

## Full Sweep

1. Open `https://www.linkedin.com/jobs/jam/` and inventory alerts.
2. Run remote C#, C# internship, remote .NET, then local .NET.
3. Apply user modifiers globally unless they conflict with a specific route.
4. Extract the top 10 results from each route.
5. Create, update, or skip alerts based on the alert inventory.
6. Reopen the alerts dashboard and report active alerts, new alerts, duplicates, and stale alerts.

## LinkedIn Hygiene

- Do not auto-apply, message recruiters, save jobs, or change profile data without explicit user confirmation.
- Do not press Enter in autocomplete fields; click the intended suggestion.
- Verify filter chips after each search loads.
- Treat `geoId` as authoritative.

## Output Template

```markdown
Route: <A|B|C|D> - <label>
URL: <final URL>
Results: <count>
Alert: <created|already-on|updated|skipped>

| # | Title | Company | Location/WT | Posted | Type | Easy Apply | Link |
|---|---|---|---|---|---|---|---|
```

## Sibling Skills

- `linkedin-csharp-job-search`
- `linkedin-csharp-internship-search`
- `linkedin-dotnet-job-search`
- `linkedin-local-dotnet-search`
