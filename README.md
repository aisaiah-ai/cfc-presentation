# AIsaiah CFC Presentation

A modern, interactive web presentation showcasing the AIsaiah spiritual fitness app for Couples for Christ Executive Governance.

## 🚀 Live Site

Visit: [https://cfc.aisaiah.org](https://cfc.aisaiah.org)

## 📋 Features

- 7 compelling slides covering member tools, leadership features, and mission
- Cinematic hero images and modern glassmorphism design
- Smooth animations and transitions
- Keyboard navigation (Arrow keys, Spacebar)
- Touch/swipe support for mobile
- Fully responsive design

## 🛠️ Local Development

Simply open `index.html` in your browser. No build step required!

```bash
open index.html
```

## 🚢 Deployment

This project is set up with automatic deployment to Cloudflare Pages via GitHub Actions.

### Initial Setup

1. **Create Cloudflare Pages Project**
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com) → Pages
   - Click "Create a project"
   - Choose "Connect to Git"
   - Select this repository
   - Configure build settings:
     - **Build command:** (leave empty)
     - **Build output directory:** `/`
   - Click "Save and Deploy"

2. **Configure Custom Domain**
   - In your Cloudflare Pages project, go to "Custom domains"
   - Click "Set up a custom domain"
   - Enter: `cfc.aisaiah.org`
   - Cloudflare will automatically configure the DNS records

3. **Set up GitHub Secrets**
   - Go to your GitHub repository → Settings → Secrets and variables → Actions
   - Add the following secrets:
     - `CLOUDFLARE_API_TOKEN`: Create an API token at Cloudflare Dashboard → My Profile → API Tokens
       - Use template "Edit Cloudflare Workers" or create custom with "Account.Cloudflare Pages" edit permissions
     - `CLOUDFLARE_ACCOUNT_ID`: Find in Cloudflare Dashboard → Pages → right sidebar

### Automatic Deployments

Once set up, every push to the `main` branch will automatically deploy to Cloudflare Pages.

- **Production:** Pushes to `main` → deployed to `cfc.aisaiah.org`
- **Preview:** Pull requests → get unique preview URLs

## 📁 Project Structure

```
.
├── index.html          # Main presentation HTML
├── style.css           # Styles with animations and glassmorphism
├── script.js           # Navigation and interaction logic
├── assets/             # Images and media
│   ├── hero.png
│   ├── community.png
│   ├── phone.png
│   ├── app_home.png
│   └── app_analytics.png
└── .github/
    └── workflows/
        └── deploy.yml  # GitHub Actions CI/CD workflow
```

## 🎨 Customization

### Editing Content
All slide content is in `index.html`. Each slide is a `<section>` with class `slide` and a `data-slide` attribute.

### Styling
Colors and design tokens are defined in `:root` CSS variables in `style.css`:
- `--accent-blue`: Primary blue accent color
- `--accent-gold`: Gold highlight color
- `--bg-dark`: Dark background
- `--text-white`: Primary text color

### Adding Slides
1. Add a new `<section class="slide" data-slide="X">` in `index.html`
2. Update `totalSlides` in `script.js`
3. Update the slide counter logic if needed

## 📝 License

Copyright © 2025 AIsaiah. All rights reserved.
Fri Nov 21 17:02:11 EST 2025
# Deployment test Fri Nov 21 17:21:36 EST 2025
