#!/usr/bin/env ruby
# sync_dates.rb
#
# Shifts all assignment assigned/due dates in _lab/, _pa/, and _lp/ from the
# previous quarter (dates_based_on) onto the new quarter (start_date), while
# preserving each date's week-of-quarter and day-of-week. A plain fixed-day
# offset only preserves day-of-week when the two start dates happen to be a
# multiple of 7 days apart (true for most back-to-back quarters, but NOT true
# in general — e.g. Spring -> Fall skips Summer and the gap is not a multiple
# of 7). Anchoring to the week containing each quarter's first lecture day
# keeps "due Friday of week 3" aligned regardless of that gap.
#
# Usage:
#   ruby sync_dates.rb           # apply changes
#   ruby sync_dates.rb --dry-run # preview without writing
#
# After running, dates_based_on in _config.yml is updated to equal start_date,
# so re-running is safe (offset becomes zero and nothing changes).

require 'yaml'
require 'date'

DRY_RUN    = ARGV.include?('--dry-run')
SCRIPT_DIR = File.dirname(File.expand_path(__FILE__))
CONFIG_PATH = File.join(SCRIPT_DIR, '_config.yml')

config = YAML.load_file(CONFIG_PATH, permitted_classes: [Date, Symbol])

target_start = Date.parse(config['start_date'].to_s)
source_start = Date.parse(config['dates_based_on'].to_s)
lecture_days = config['lecture_days'] || [1]
holidays     = (config['holidays'] || []).map { |h| Date.parse(h['date'].to_s) }

# Anchor each quarter to the first occurrence (on or after its start_date) of
# the earliest lecture weekday (e.g. Monday), so week/weekday-of-quarter is
# comparable across quarters even when start_date itself isn't that weekday.
first_lecture_weekday = lecture_days.min

def week_anchor(date, weekday)
  date + ((weekday - date.cwday) % 7)
end

anchor_source = week_anchor(source_start, first_lecture_weekday)
anchor_target = week_anchor(target_start, first_lecture_weekday)

quarter = config['quarter'] || config['qtr'] || 'course'
puts "=== Date sync — #{quarter} ==="
puts "(dry run)\n\n" if DRY_RUN
puts "  dates_based_on : #{source_start}  (week anchor #{anchor_source})"
puts "  start_date     : #{target_start}  (week anchor #{anchor_target})\n\n"

if anchor_source == anchor_target
  puts "Week anchors match — dates are already aligned with start_date. Nothing to do."
  exit 0
end

# new_date = same (week offset, weekday) from anchor_target as old_date was from anchor_source
shift = lambda do |old_date|
  delta = (old_date - anchor_source).to_i
  week_offset = delta / 7
  weekday_remainder = delta % 7
  anchor_target + week_offset * 7 + weekday_remainder
end

# Regex to capture the full date field with time and timezone, e.g.:
#   assigned: 2026-01-05 09:00:00.00-08:00
DATE_FIELD_RE = /^(assigned|due): (\d{4}-\d{2}-\d{2})( .+)?$/

dirs = %w[_lab _pa _lp].map { |d| File.join(SCRIPT_DIR, d) }
files = dirs.flat_map { |d| Dir.glob(File.join(d, '*.md')) }.sort

changed = 0
holiday_hits = []
files.each do |path|
  content = File.read(path)

  # Only process front matter (between the first two --- markers)
  parts = content.split(/^---\s*$/, 3)
  next if parts.size < 3  # no valid front matter

  _, fm, body = parts
  new_fm = fm.gsub(DATE_FIELD_RE) do
    field    = $1
    old_date = Date.parse($2)
    rest     = $3 || ''
    new_date = shift.call(old_date)
    holiday_hits << [File.basename(path), field, new_date] if holidays.include?(new_date)
    "#{field}: #{new_date}#{rest}"
  end

  next if new_fm == fm   # nothing changed in this file

  new_content = "---\n#{new_fm}---\n#{body}"
  rel = path.sub(SCRIPT_DIR + '/', '')

  # Show what changed
  fm.scan(DATE_FIELD_RE).each do |field, date_str, rest|
    new_date = shift.call(Date.parse(date_str))
    puts "  #{File.basename(path)}  #{field}: #{date_str} → #{new_date}"
  end

  File.write(path, new_content) unless DRY_RUN
  changed += 1
end

puts ""
if changed == 0
  puts "No date fields found to update."
else
  puts "#{DRY_RUN ? 'Would update' : 'Updated'} #{changed} file(s)."
end

if holiday_hits.any?
  puts "\nWARNING: these shifted dates land on a holiday — review manually:"
  holiday_hits.each { |file, field, date| puts "  #{file}  #{field}: #{date}" }
end

# Update dates_based_on in _config.yml to reflect new state
unless DRY_RUN
  config_text = File.read(CONFIG_PATH)
  new_config_text = config_text.sub(
    /^dates_based_on:.*$/,
    "dates_based_on: #{target_start}   # Assignment dates currently use this quarter's start; updated by sync_dates.rb"
  )
  if new_config_text != config_text
    File.write(CONFIG_PATH, new_config_text)
    puts "Updated dates_based_on in _config.yml to #{target_start}."
  end
end

puts "\nDone#{DRY_RUN ? ' (dry run — no files written)' : ''}."
