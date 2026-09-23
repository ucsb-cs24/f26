# Quarter Sync Workflow

How to set up this course website for a new quarter.

## Scripts

| Script | Purpose |
|--------|---------|
| `sync_holidays.rb` | Creates/renames holiday placeholder files in `_lectures/` |
| `sync_dates.rb` | Shifts all `assigned`/`due` dates in `_lab/`, `_pa/`, `_lp/` |

---

## Steps for a new quarter

### 1. Update `_config.yml`

Change these fields:

```yaml
start_date: YYYY-MM-DD        # First Monday of instruction
dates_based_on: YYYY-MM-DD   # Set to the previous quarter's start_date
                               # (sync_dates.rb uses this to compute the offset)
holidays:
  - date: "YYYY-MM-DD"
    desc: "Holiday Name"
  # add one entry per holiday that falls on a lecture day
```

Also update: `url`, `baseurl`, `qtr`, `quarter`, `name`, `title`, `lect_repo`, `class_org`, `lecture_times`, `lecture_location`, `cal_dates`, `final_exam_date`, `final_exam_time`, `tas`, `ulas`, `gsrs`, etc.

### 2. Update `_data/navigation.yml`

Jekyll does **not** render Liquid inside `_data/*.yml` files, so these can't
read from `_config.yml` automatically — they must be hand-edited every
quarter:

```yaml
offerings:
   title: F26            # <- update
   baseurl: /f26          # <- update
   items:
      - title: F26-Home   # <- update
        baseurl: /f26      # <- update

  - title: Github
    dropdown:
       - title: ucsb-cs24-f26                        # <- update
         url: https://github.com/ucsb-cs24-f26       # <- update

  - title: Ed
    url: https://edstem.org/...                       # <- update to this quarter's Ed course
```

### 3. Sync holiday lecture files

```bash
ruby sync_holidays.rb --dry-run   # preview
ruby sync_holidays.rb             # apply
```

This reads `start_date`, `lecture_days`, and `holidays` from `_config.yml` and:
- Creates `_lectures/lect{N}a.md` (or `b`, `c`, …) for each holiday, where N is the
  count of actual lectures *before* the holiday in the schedule
- Hardcodes the `lecture_date` field (required because the date-computation include
  skips holidays and can never return a holiday date via sequence number)
- Reports any stale holiday files from the previous quarter so you can delete them

### 4. Shift assignment dates

```bash
ruby sync_dates.rb --dry-run   # preview
ruby sync_dates.rb             # apply
```

This shifts every `assigned` and `due` field in `_lab/*.md`, `_pa/*.md`, and
`_lp/*.md` so each date keeps the same **week-of-quarter and day-of-week** it
had relative to the previous quarter's start — anchored to the first
occurrence of the earliest `lecture_days` weekday on/after each quarter's
`start_date`. This is *not* a flat day-count shift: a flat shift only
preserves day-of-week when the two start dates happen to be a multiple of 7
days apart (true for most back-to-back quarters, but false whenever a
transition skips a quarter, e.g. Spring → Fall). After applying, it updates
`dates_based_on` in `_config.yml` to equal `start_date`, so re-running the
script is safe (nothing changes on a second run).

The script also warns if any shifted date lands on a configured holiday
(e.g. an assignment shifting onto Thanksgiving) — review and manually adjust
those before publishing.

### 5. Check the lecture count

The number of lecture slots varies by quarter depending on when holidays fall:

```
lecture slots = (num_weeks + extra_exam_week) × lectures_per_week − holidays_on_lecture_days
```

For example, S26 (10 weeks, MW, 1 holiday) → **19 slots**; W26 (10 weeks, MW, 2 holidays) → **18 slots**.

If the slot count changed from the previous quarter:
- **More slots than lecture files:** add a new lecture file for the extra slot
  (e.g., if a "Quiz" or "Final Review" now gets its own day)
- **Fewer slots than lecture files:** merge or remove a lecture file

The lecture files use `sequence: N` (auto-computes the date) — just keep the
sequence numbers contiguous starting at 1. Holiday placeholder files use
`lecture_date: YYYY-MM-DD` instead of a sequence number.

### 6. Update content

- `lect18.md` / `lect19.md` — update quiz/final-review exam logistics (date, location, seating chart links); these already pull `final_exam_date`/`final_exam_time` from `_config.yml`, so just the config needs updating
- `_config.yml` `cal_dates` — update important dates (drop deadline, instruction end, final exam, quarter end)
- Any assignment files that reference quarter-specific dates, repos, or Gradescope links

### 7. Test locally

```bash
./jekyll.sh   # starts Jekyll at http://localhost:4000/<baseurl>
```

Check:
- Top nav bar shows the right quarter label/link and a working Github/Ed link
- Lecture table shows correct dates and no gaps
- Holiday rows appear in the right place
- Assignment assigned/due dates look reasonable
- All internal links resolve

---

## How lecture date computation works

Regular lecture files (`lect01.md` … `lect19.md`) use:
```yaml
sequence: N
```
The `_includes/compute_lecture_date.liquid` include walks the calendar from
`start_date`, counts Mon/Wed slots, skips holidays, and returns the Nth date.

Holiday placeholder files (`lect16a.md`, etc.) use:
```yaml
lecture_date: 2026-05-25
```
They cannot use `sequence` because the include skips holidays and would never
return the holiday date itself.

---

## Example: W26 → S26

| Field | W26 | S26 |
|-------|-----|-----|
| `start_date` | 2026-01-05 | 2026-03-30 |
| `holidays` | MLK Day (1/19), Presidents Day (2/16) | Memorial Day (5/25) |
| Lecture slots | 18 | 19 |
| Date offset | — | +84 days (12 weeks) |
