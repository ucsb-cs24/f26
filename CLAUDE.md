# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based course website for **UCSB CS24: Problem Solving with Computers II** (Winter 2026). The site uses the `ucsb-cs-course-repos/course-repo-jekyll-theme` remote theme and follows the standard UCSB CS course website structure, with enhanced accessibility and mobile responsiveness features.

**Key Information:**
- Course: CS24 - Data Structures and Algorithms in C++
- Quarter: Winter 2026 (W26)
- Instructor: Diba Mirza
- Lecture Times: MW 11:00a - 12:15p
- Lecture Location: BUCHN 1910
- Site URL: https://ucsb-cs24.github.io/w26
- GitHub Org: ucsb-cs24-w26

## What's New in W26

### Enhanced Accessibility
- **WCAG AA Compliance**: All text meets 4.5:1 contrast ratio minimum
- **Keyboard Navigation**: Skip-to-content links and enhanced focus indicators
- **Screen Reader Support**: Comprehensive ARIA labels and semantic HTML
- **Responsive Tables**: Mobile-friendly with proper captions and scoping

### Technical Improvements
- **Ruby 3.3.6**: Upgraded from 3.0.3 for better security and performance
- **Modern Dependencies**: Latest stable gems and bundler
- **Custom CSS**: `assets/css/custom.css` with accessibility and responsive styles

### New Files
- `_includes/head-custom.html` - Custom head content with accessibility meta tags
- `_includes/accessibility-nav.html` - Enhanced navigation with ARIA attributes
- `assets/css/custom.css` - Comprehensive accessibility and mobile styles

## Development Commands

### Setup
```bash
./setup.sh
# Installs Ruby 3.3.6 via RVM, bundler, and all dependencies
```

### Running Locally
```bash
./jekyll.sh
# Starts Jekyll development server using RVM Ruby 3.3.6
# Equivalent to: bundle exec jekyll serve
```

The site will be available at `http://localhost:4000/w26`

### Building the Site
```bash
bundle exec jekyll build
# Generates static site in _site/ directory
```

## Site Architecture

### Jekyll Collections

The site uses Jekyll collections to organize different types of content. Each collection has:
- A dedicated directory (e.g., `_lab/`, `_pa/`, `_lectures/`)
- YAML front matter defining metadata
- Custom layouts and includes for rendering

**Collections:**
1. **`_lectures/`** - Lecture slides and notes
   - Front matter: `num`, `lecture_date`, `desc`, `ready`, `pdfurl`, `annotatedpdfurl`
   - Layout: `lecture`
   - Rendered via `lecnot_table.html` (enhanced with ARIA labels)

2. **`_lab/`** - Lab assignments
   - Front matter: `num`, `ready`, `desc`, `assigned`, `due`
   - Layout: `lab`
   - Individual assignments typically completed during sections

3. **`_pa/`** - Programming assignments (major projects)
   - Front matter: `num`, `ready`, `desc`, `assigned`, `due`
   - Layout: `lab` (same as labs)
   - Larger, often pair-programming assignments
   - Require starter code from GitHub (e.g., `https://github.com/ucsb-cs24-w26/STARTER-lab05`)

4. **`_info/`** - Course information pages
   - Contains: `syllabus.md`, `staff.md`, `calendar.md`
   - Layout: `default` or `handout`

5. **`_exam/`** - Exam information
   - Layout: `exam_info`

### Key Configuration

**`_config.yml`** contains:
- Site metadata (course, quarter, instructor, TAs/ULAs)
- URL configuration (`url`, `baseurl`)
- Collection definitions and permalinks
- Layout defaults for each content type
- Calendar dates (`cal_dates`) for important deadlines
- Date calculation: `start_week`, `start_date`, `num_weeks`

**Important dates for W26:**
- First day of classes: 2026-01-05
- Drop deadline (no W grade): 2026-01-23
- Presidents Day - No lecture: 2026-02-16
- W26 Instruction Ends: 2026-03-13
- Final Exam: 2026-03-18
- W26 Quarter Ends: 2026-03-20

**`_data/navigation.yml`** defines:
- Top navigation structure
- Dropdowns and external links (Ed, GitHub)
- Cross-quarter navigation (production_url pattern)

### Important Includes

Located in `_includes/`:
- `lecnot_table.html` - Renders lecture table with enhanced accessibility (ARIA labels, semantic HTML)
- `pa_table.html` - Renders programming assignment table
- `mathjax.html` - Math rendering support
- `minutes.liquid` - Time formatting utility
- `head-custom.html` - Custom head content with accessibility features
- `accessibility-nav.html` - Enhanced navigation with ARIA roles

### Custom Styling

**`assets/css/custom.css`** provides:
- WCAG AA compliant color contrast
- Enhanced focus indicators for keyboard navigation
- Skip-to-content links
- Mobile-responsive tables and layouts
- Print-friendly styles
- Dark mode support (system preference)
- Reduced motion support
- Screen reader utilities (.sr-only class)

### Content Structure

**Lecture Files:**
- Reference lecture code repo: `{{site.lect_repo}}/tree/main/{{page.num}}`
- Include PDF slides: `pdfurl` and optionally `annotatedpdfurl`
- Mark as `ready: true` when published
- Use semantic `<time>` elements for dates

**Assignment Files:**
- Include collaboration policy section
- Link to starter code repositories
- Specify learning goals and objectives
- Include submission instructions and grading criteria

## Creating New Content

### Adding a Lecture
1. Create `_lectures/lectXX.md` with front matter:
```yaml
---
num: "lectXX"
lecture_date: 2026-MM-DD
desc: "Brief description"
ready: true
pdfurl: /lectures/CS24_LectureXX.pdf
annotatedpdfurl: /lectures/CS24_LectureXX_ann.pdf
annotatedready: true
---
```
2. Add lecture content and link to code repo
3. PDF files should be placed in `lectures/` directory

### Adding a Lab/PA
1. Create `_lab/labXX.md` or `_pa/paXX.md` with front matter:
```yaml
---
num: labXX
ready: true
desc: "Brief description"
assigned: 2026-MM-DD HH:MM:SS.00-8
due: 2026-MM-DD HH:MM:SS.00-8
---
```
2. Include sections: Collaboration policy, Learning Goals, Instructions
3. Reference starter code from appropriate GitHub repo (ucsb-cs24-w26)

## Accessibility Guidelines

When creating content for this site:

### HTML/Markdown
- Use proper heading hierarchy (h1 → h2 → h3, no skipping)
- Add alt text to all images
- Use semantic HTML elements (`<nav>`, `<main>`, `<article>`, etc.)
- Include ARIA labels for dynamic content
- Use `<time>` elements for dates

### Links and Navigation
- Provide descriptive link text (avoid "click here")
- Add `aria-label` for icon-only links
- Ensure keyboard navigation works (test with Tab key)

### Tables
- Always include `<caption>` or `.sr-only` caption
- Use `scope="col"` and `scope="row"` on headers
- Add `role="table"` and `aria-label` for clarity

### Color and Contrast
- Ensure text meets 4.5:1 contrast ratio (WCAG AA)
- Don't rely on color alone to convey information
- Test with a color contrast checker

### Forms and Interactive Elements
- Label all form inputs
- Group related form elements with `<fieldset>`
- Provide clear error messages

## Special Considerations

- **Time zones:** All dates use `America/Los_Angeles` timezone
- **Assignment times:** Use format `YYYY-MM-DD HH:MM:SS.00-8` for Pacific time
- **Ruby version:** Site requires Ruby 3.3.6 (managed via RVM)
- **Remote theme:** Updates to `ucsb-cs-course-repos/course-repo-jekyll-theme` affect all course sites
- **Markdown:** Uses kramdown parser with `parse_block_html: true`
- **Cross-quarter navigation:** Multiple quarter sites (s25, w26, etc.) share common parent at `ucsb-cs24.github.io`

## Course-Specific Context

- Focus on data structures and algorithms in C++
- Heavy use of STL (Standard Template Library)
- Pair programming encouraged for most PAs
- Caliber coding practice/homework worth 10% of grade
- Mock interviews required with TAs/ULAs
- Topics include: linked lists, trees, BSTs, hash tables, graphs, complexity analysis

## Testing Checklist

Before deploying content:

- [ ] Test keyboard navigation (Tab, Shift+Tab, Enter)
- [ ] Verify skip-to-content link works
- [ ] Check color contrast with a tool
- [ ] Test on mobile devices
- [ ] Verify tables scroll horizontally on small screens
- [ ] Test with screen reader if possible
- [ ] Validate HTML (no errors)
- [ ] Check all links work
