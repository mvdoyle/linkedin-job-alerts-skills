---
name: linkedin-dotnet-job-search
description: Runs the user's remote .NET LinkedIn job search for Internship, Entry, and Associate full-time or contract roles posted in the past 24 hours. Use when the user asks for .NET jobs, dotnet jobs, remote .NET roles, junior .NET roles, or .NET contract opportunities.
---

# Remote .NET Junior Job Search

## Runtime

Use this through the Claude Code Chrome extension with an authenticated LinkedIn session in the active Chrome profile.

## Search Definition

- Keywords: `.net`
- Location: United States
- Location `geoId`: `103644278`
- Date posted: Past 24 hours
- Experience: Internship, Entry, Associate
- Job type: Full-time, Contract
- Workplace: Remote
- Sort: Most relevant unless the user requests newest/latest/most recent

## Default URL

`https://www.linkedin.com/jobs/search/?keywords=.net&geoId=103644278&f_TPR=r86400&f_E=1%2C2%2C3&f_JT=F%2CC&f_WT=2&sortBy=R`

## Steps

1. Open `https://www.linkedin.com/jobs/jam/` and check for an equivalent alert before creating a new one.
2. Navigate to the default URL, applying any user-requested modifiers first.
3. Confirm the visible filter chips match the search definition.
4. Extract the top 10 visible results.
5. If no equivalent alert exists, toggle **Set alert** on the results page.
6. Report whether the alert was created, already active, updated, or skipped.

## Allowed Modifiers

- newest, latest, most recent: set `sortBy=DD`
- this week, past week: set `f_TPR=r604800`
- this month, past month: set `f_TPR=r2592000`
- no internships: set `f_E=2,3`
- include mid-level: set `f_E=1,2,3,4`
- full-time only: set `f_JT=F`
- include part-time: set `f_JT=F,C,P`

## Do Not Do

- Do not apply to jobs.
- Do not message recruiters.
- Do not save jobs unless the user explicitly asks.
- Do not switch to the local route unless the user asks for local, hybrid, on-site, commute, or home-town roles.

## Output Template

```markdown
Route: C - Remote .NET Junior + Contract
URL: <final URL>
Results: <count>
Alert: <created|already-on|updated|skipped>

| # | Title | Company | Location/WT | Posted | Type | Easy Apply | Link |
|---|---|---|---|---|---|---|---|
```
