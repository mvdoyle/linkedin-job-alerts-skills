---
name: linkedin-csharp-internship-search
description: Runs the user's remote C# LinkedIn internship search for full-time internship roles posted in the past 24 hours. Use when the user asks for C# internships, C# intern roles, remote C# internships, or early-career C# internship searches.
---

# Remote C# Internship Search

## Runtime

Use this through the Claude Code Chrome extension with an authenticated LinkedIn session in the active Chrome profile.

## Search Definition

- Keywords: `c#`
- Location: United States
- Location `geoId`: `103644278`
- Date posted: Past 24 hours
- Experience: Internship
- Job type: Full-time
- Workplace: Remote
- Sort: Most relevant unless the user requests newest/latest/most recent

## Default URL

`https://www.linkedin.com/jobs/search/?keywords=c%23&geoId=103644278&f_TPR=r86400&f_E=1&f_JT=F&f_WT=2&sortBy=R`

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
- include entry-level jobs too: set `f_E=1,2`
- internship job type only: set `f_JT=I`
- full-time plus internship job type: set `f_JT=F,I`

## Do Not Do

- Do not apply to jobs.
- Do not message recruiters.
- Do not save jobs unless the user explicitly asks.
- Do not broaden to Entry or Associate unless the user asks.

## Output Template

```markdown
Route: B - Remote C# Internship
URL: <final URL>
Results: <count>
Alert: <created|already-on|updated|skipped>

| # | Title | Company | Location/WT | Posted | Type | Easy Apply | Link |
|---|---|---|---|---|---|---|---|
```
