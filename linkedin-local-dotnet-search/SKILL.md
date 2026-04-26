---
name: linkedin-local-dotnet-search
description: Runs the user's local home-town .NET LinkedIn search for on-site and hybrid Internship, Entry, and Associate full-time or contract roles posted in the past week. Use when the user asks for local .NET jobs, nearby dotnet roles, on-site .NET jobs, hybrid .NET jobs, commute-friendly jobs, or home-town searches.
---

# Local .NET Job Search

## Runtime

Use this through the Claude Code Chrome extension with an authenticated LinkedIn session in the active Chrome profile.

## Home-Town Configuration

- Location: Birmingham, Alabama, United States
- LinkedIn `geoId`: `102905961`
- Avoid confusing this with Birmingham, United Kingdom (`geoId=104769905`).
- If the user moves, update this section and the default URL.

## Search Definition

- Keywords: `.net`
- Location: Birmingham, Alabama, United States
- Date posted: Past week
- Experience: Internship, Entry, Associate
- Job type: Full-time, Contract
- Workplace: On-site, Hybrid
- Sort: Most relevant unless the user requests newest/latest/most recent

## Default URL

`https://www.linkedin.com/jobs/search/?keywords=.net&geoId=102905961&f_TPR=r604800&f_E=1%2C2%2C3&f_JT=F%2CC&f_WT=1%2C3&sortBy=R`

## Steps

1. Open `https://www.linkedin.com/jobs/jam/` and check for an equivalent alert before creating a new one.
2. Navigate to the default URL, applying any user-requested modifiers first.
3. Confirm the visible filter chips match the search definition.
4. Extract the top 10 visible results.
5. If no equivalent alert exists, toggle **Set alert** on the results page.
6. Report whether the alert was created, already active, updated, or skipped.

## Allowed Modifiers

- newest, latest, most recent: set `sortBy=DD`
- past 24 hours: set `f_TPR=r86400`
- this month, past month: set `f_TPR=r2592000`
- remote ok: set `f_WT=1,2,3`
- hybrid only: set `f_WT=3`
- on-site only: set `f_WT=1`
- no internships: set `f_E=2,3`
- include mid-level: set `f_E=1,2,3,4`
- full-time only: set `f_JT=F`
- within N miles: append or update `distance=N`

## Do Not Do

- Do not apply to jobs.
- Do not message recruiters.
- Do not save jobs unless the user explicitly asks.
- Do not change the home-town `geoId` unless the user explicitly provides a new local market.

## Output Template

```markdown
Route: D - Local .NET
URL: <final URL>
Results: <count>
Alert: <created|already-on|updated|skipped>

| # | Title | Company | Location/WT | Posted | Type | Easy Apply | Link |
|---|---|---|---|---|---|---|---|
```
