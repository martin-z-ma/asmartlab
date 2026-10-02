# A-SMART Lab Hugo Website

This is a self-contained Hugo site with no external theme or module dependency. The main navigation includes a Home link to the landing page.

This is workable version.

## Run on Windows

1. Extract the ZIP.
2. Open PowerShell in the `a-smart-lab-complete` folder.
3. Run `hugo server`.
4. Open `http://localhost:1313/`.

## Important folders

- `content/`: page content, including the Teaching page
- `layouts/`: page templates and shortcodes
- `static/css/site.css`: visual design
- `static/images/publications/`: publication images
- `static/papers/`: author-approved PDFs

## Publication section

The Publications page includes 67 expandable entries: 38 journal articles, 3 technical reports, and 26 conference proceedings. Missing image files are represented by a clean placeholder. Add a `pdf` field only when you have permission to redistribute the file.

## GitHub Pages

Change `baseURL` in `hugo.toml` to your final site address before deployment.

## Homepage hero

The hero uses a shortened methods-focused headline, a separate application-domain line, one primary CTA, and a research-theme orbit graphic.
