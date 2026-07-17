# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions.

## Architecture

Three sibling pages share one stylesheet:

- `index.html` — single-page portfolio; sections are anchor-linked (`#home`, `#about`, `#services`, `#courses`, `#book`, `#community`, `#contact`).
- `privacy.html`, `terms.html` — legal pages, linked only *from* `index.html`'s footer (they do not link back or to each other).
- `style.css` — the **only** stylesheet; loaded by all three pages. Any style change lives here.
- `images/` — local assets (`logo.png`, `profile.jpg`, `signature.png`, course thumbnails).
- Pure HTML5 and CSS3. No JavaScript. No build step. No framework.

External dependencies are CDN-loaded, so the site needs internet at view time: Font Awesome 6.5.0 (icons) and Udemy CDN images (course thumbnails in the courses section). Only `images/` assets are self-hosted.

Note: `index.html` has a `<span id="year">` in the footer intended to be filled by JS, but no script exists, so it renders empty.

## Commands

There is no build, lint, or test tooling. Work with the files directly.

```bash
# Terraform
cd terraform && terraform init
cd terraform && terraform plan
cd terraform && terraform apply

- **Local preview:** `python3 -m http.server 8000` then open `http://localhost:8000`
- **Deploy (per README):** copy the HTML/CSS/`images/` to Nginx's web root (`/var/www/html`) on an Ubuntu VM, `sudo systemctl enable --now nginx`, verify at `http://<public-ip>`.
```

## Safety Layers

- Never put secrets in this file. No API keys, passwords, or AWS credentials
- Never delete or rewrite README.md's DMI rules section without being explicitly asked.
- Never introduce a build step, package manager, or JavaScript framework into this repo — the "no build step" constraint is intentional and part of the exercise.
- Before any deploy, the footer in `index.html` (the "Crafted with cloud excellence by Pravin Mishra" line) must be edited to add a visible `Deployed by:` line with cohort / name / group / week / date. This line is the required proof for screenshot submission — do not remove or overwrite it when making other footer changes.


## Conventions

- All infrastructure changes go through Terraform — never modify AWS resources manually
- No JavaScript in this project
- CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px

