# Automatic Date Computation System

This system allows you to compute lecture and assignment dates automatically based on sequence numbers and relative offsets, making it easy to adapt schedules across quarters.

## Configuration (_config.yml)

**Minimal configuration - just 3 settings needed:**

```yaml
start_week: 0                 # Set to 0 for Week 0, or 1 for regular quarter
start_date: 2026-01-04        # First day of instruction (or Sunday before Week 0)
lecture_days: [2, 4]          # 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri

# Optional: holidays (quote dates!)
holidays:
  - date: "2026-02-16"
    desc: "Presidents Day"
```

**Week 0 is auto-detected** from `start_week`:
- `start_week: 0` → Automatically skips first day of week (e.g., Tuesday for TR schedule)
- `start_week: 1` → Regular schedule, both lecture days from Week 1

## For Lectures

### Option 1: Use sequence numbers (RECOMMENDED for future)

Instead of hardcoding `lecture_date`, add a `sequence` field:

```yaml
---
num: "lect01"
sequence: 1              # 1st lecture of the quarter
desc: "Course introduction"
ready: true
pdfurl: /lectures/CS24_Lecture1.pdf
---
```

The system will:
- Detect Week 0 automatically from `start_week` value
- Start from `start_date`
- If Week 0 (start_week: 0), skip the first lecture day of the week
- Find the Nth occurrence of lecture days
- Skip any holidays
- Example: For TR with Week 0, sequence 1 = Thu Jan 8, sequence 2 = Tue Jan 13, etc.

### Option 2: Keep using lecture_date (CURRENT)

You can continue using `lecture_date` and the system will work as before. The computed dates only apply when `sequence` is provided.

##For Assignments

### Using relative dates (FUTURE - not yet implemented in assignment tables)

```yaml
---
num: lab01
assigned_after_lecture: 1    # Released after lect01
due_days_later: 4            # Due 4 days after release
due_day_of_week: 5           # Target Friday (5=Friday)
---
```

This would compute:
- assigned: lect01 date (Mon Jan 5) = Mon Jan 5, 9am
- due: 4 days later, next Friday = Fri Jan 9, 11:59pm

### Current method (what you're using now)

Continue using hardcoded dates:
```yaml
assigned: 2026-01-05 09:00:00.00-08:00
due: 2026-01-09 23:59:00.00-08:00
```

## Changing Quarters

**Just change 3 lines!** Switch from W26 to S26 (or any other quarter):

```yaml
# From W26 (MW, Week 1):
start_week: 1
start_date: 2026-01-05
lecture_days: [1, 3]

# To S26 (TR, Week 0):
start_week: 0
start_date: 2026-04-03
lecture_days: [2, 4]

# Update holidays:
holidays:
  - date: "2026-05-25"
    desc: "Memorial Day"
```

That's it! All lecture dates recompute automatically.

## Migration Path

**Current Status:**
- ✅ Computation system created (_includes/compute_lecture_date.liquid)
- ✅ Lecture table updated to support both methods
- ✅ Config file updated with schedule settings
- ✅ All lectures migrated to use `sequence` numbers (lect01-lect19)
- ✅ System tested and verified working correctly with holiday handling
- ✅ Assignment dates (`_lab/`, `_pa/`, `_lp/`) are shifted quarter-to-quarter by
  `sync_dates.rb`, which preserves each date's week-of-quarter and day-of-week
  (see QUARTER_SYNC.md) — they still use manual/hardcoded dates in front
  matter, but a one-command script keeps them correct across quarter changes
- ⏳ True per-assignment runtime computation (`assigned_after_lecture` /
  `due_days_later` / `due_day_of_week`, resolved live via
  `_includes/compute_due_date.liquid`) is still unimplemented — the include
  exists but nothing calls it yet. Worthwhile future work if hardcoded
  front-matter dates ever become a problem, but not required today.

## Benefits

✅ **Change one config** - Switch quarters by updating `start_date` and `holidays`
✅ **No manual calculations** - System handles weekdays, holidays, and date arithmetic
✅ **Consistent patterns** - All MW or all TR, all Fridays for due dates
✅ **Easy to verify** - Sequence numbers are obvious (lect12 is 12th lecture)
✅ **Future-proof** - Works with any quarter length, schedule, or holiday pattern

## Week 0 Support

Some quarters start with a "Week 0" that has reduced lecture schedule:
- **Week 0**: Only has lectures on the second day of the week (e.g., Thursday for TR schedule)
- **Week 1+**: Regular schedule resumes (both Tuesday and Thursday)

**Week 0 is automatic!** Just set `start_week: 0`:

```yaml
start_week: 0           # Week 0 detected automatically
start_date: 2026-01-04  # Sunday before Week 0 (or first Thursday)
lecture_days: [2, 4]    # TR schedule
```

The system automatically:
- Skips the first Tuesday (if TR) or first Monday (if MW)
- Starts lectures on the second day of the week
- Resumes regular pattern from Week 1 onward

**Example**: TR schedule with Week 0:
- First lecture: Thu Jan 8 (skips Tue Jan 6)
- Week 1 starts: Tue Jan 13, Thu Jan 15
- Continues regular TR pattern

## Day of Week Reference

```
1 = Monday
2 = Tuesday
3 = Wednesday
4 = Thursday
5 = Friday
6 = Saturday
7 = Sunday
```

## Examples

**Example 1: TR Schedule with Week 0**
```yaml
start_week: 0
start_date: 2026-01-04  # Sunday before Week 0 (or Thu Jan 8)
lecture_days: [2, 4]
```
- sequence 1 → Thu Jan 8 (Week 0, Thursday only)
- sequence 2 → Tue Jan 13 (Week 1 regular pattern starts)
- sequence 3 → Thu Jan 15
- sequence 4 → Tue Jan 20

**Example 2: MW Schedule (regular quarter)**
```yaml
start_week: 1
start_date: 2026-03-30  # First Monday
lecture_days: [1, 3]
```
- sequence 1 → Mon Mar 30
- sequence 2 → Wed Apr 1
- sequence 3 → Mon Apr 6

**Example 3: TR Schedule (regular quarter)**
```yaml
start_week: 1
start_date: 2026-01-06  # First Tuesday
lecture_days: [2, 4]
```
- sequence 1 → Tue Jan 6
- sequence 2 → Thu Jan 8
- sequence 3 → Tue Jan 13

**Example 4: With Holiday (Presidents Day)**
```yaml
start_week: 1
start_date: 2026-01-05
lecture_days: [1, 3]
holidays:
  - date: "2026-02-16"  # MUST be quoted!
    desc: "Presidents Day"
```
- System automatically skips Mon Feb 16
- Continues: Wed Feb 11 → [skip Mon Feb 16] → Wed Feb 18
