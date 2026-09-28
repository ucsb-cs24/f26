# CS24 Winter 2026

Course website for UCSB CS24: Problem Solving with Computers II - Winter 2026

**Instructor:** Diba Mirza
**Site URL:** https://ucsb-cs24.github.io/w26

## What's New in W26

This version includes significant improvements over the S25 site:

### Accessibility Enhancements
- **WCAG AA Compliance**: Enhanced color contrast for all text and interactive elements
- **Keyboard Navigation**: Improved focus indicators and skip-to-content links
- **Screen Reader Support**: Proper ARIA labels, semantic HTML, and table captions
- **Responsive Design**: Mobile-first approach with improved tablet and phone layouts

### Technical Updates
- **Ruby 3.3.6**: Upgraded from Ruby 3.0.3 for better security and performance
- **Modern Dependencies**: Updated gems and bundler to latest stable versions
- **Custom CSS**: Added comprehensive accessibility and mobile responsiveness styles

### User Experience
- **Better Typography**: Improved readability with optimized line spacing and font sizes
- **Responsive Tables**: Mobile-friendly tables with horizontal scrolling
- **Dark Mode Support**: Respects system preferences for dark/light themes
- **Print Styles**: Optimized layouts for printing course materials

## Development Setup

### Prerequisites
- RVM (Ruby Version Manager)
- Git

### Installation

```bash
# Run the setup script
./setup.sh
```

This will:
1. Install Ruby 3.3.6 via RVM
2. Install bundler and required gems
3. Set up all Jekyll dependencies

### Running Locally

```bash
# Start the Jekyll development server
./jekyll.sh
```

The site will be available at `http://localhost:4000/w26`

### Building the Site

```bash
bundle exec jekyll build
```

Generated files will be in the `_site/` directory.

## Site Structure

### Collections
- `_lectures/` - Lecture slides and notes
- `_lab/` - Lab assignments
- `_pa/` - Programming assignments
- `_info/` - Course information (syllabus, staff, calendar)
- `_exam/` - Exam information

### Key Files
- `_config.yml` - Site configuration
- `_data/navigation.yml` - Navigation menu structure
- `_includes/` - Reusable HTML components
- `assets/css/custom.css` - Custom accessibility and responsive styles

## Accessibility Features

This site is designed to be accessible to all students:

- **Skip Navigation**: Keyboard users can skip directly to main content
- **Focus Indicators**: Clear visual feedback for keyboard navigation
- **ARIA Labels**: Descriptive labels for screen reader users
- **Semantic HTML**: Proper heading hierarchy and landmark regions
- **Color Contrast**: All text meets WCAG AA standards (4.5:1 minimum)
- **Responsive Images**: Images scale appropriately on all devices
- **Reduced Motion**: Respects user preference for reduced animations

## Contributing

When adding new content:

1. Use proper semantic HTML
2. Add ARIA labels to interactive elements
3. Ensure color contrast meets WCAG AA standards
4. Test keyboard navigation
5. Verify mobile responsiveness

## License

See LICENSE file for details.

## Support

For issues or questions:
- Course staff: See staff page on the website
- Technical issues: Contact the instructor

---

**Note:** This site is built with Jekyll and uses the UCSB CS course theme with custom accessibility enhancements.
