# Deployment Guide - Cloudflare Pages

This guide walks you through deploying the AIsaiah presentation to `cfc.aisaiah.org` using Cloudflare Pages with GitHub Actions CI/CD.

## Prerequisites

- GitHub account
- Cloudflare account with `aisaiah.org` domain configured
- Git installed locally

## Step-by-Step Deployment

### 1. Initialize Git Repository (if not done)

```bash
cd /Users/Shared/users/AMDShared/WorkspaceShared/presentation/ag_presentation/presentation_web
git init
git add .
git commit -m "Initial commit: AIsaiah CFC Presentation"
```

### 2. Create GitHub Repository

**Option A: Via GitHub CLI (if installed)**
```bash
gh repo create aisaiah-ai/cfc-presentation --public --source=. --push
```

**Option B: Via GitHub Web Interface**
1. Go to [github.com/new](https://github.com/new)
2. Repository name: `cfc-presentation`
3. Set to Public or Private (your choice)
4. **Do NOT** initialize with README (we already have files)
5. Click "Create repository"
6. Follow the commands shown to push existing repository:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/cfc-presentation.git
   git branch -M main
   git push -u origin main
   ```

### 3. Create Cloudflare API Token

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/profile/api-tokens)
2. Click "Create Token"
3. Use template: **"Edit Cloudflare Workers"** OR create custom token with:
   - **Permissions:**
     - Account → Cloudflare Pages → Edit
   - **Account Resources:**
     - Include → Your Account
4. Click "Continue to summary" → "Create Token"
5. **Copy the token** (you won't see it again!)

### 4. Get Cloudflare Account ID

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Click on "Pages" in the left sidebar
3. Your Account ID is visible in the right sidebar
4. Copy it (format: `abc123def456...`)

### 5. Add GitHub Secrets

1. Go to your GitHub repository
2. Navigate to: **Settings** → **Secrets and variables** → **Actions**
3. Click "New repository secret" and add:
   - **Name:** `CLOUDFLARE_API_TOKEN`
   - **Value:** [paste the token from step 3]
4. Click "Add secret"
5. Add another secret:
   - **Name:** `CLOUDFLARE_ACCOUNT_ID`
   - **Value:** [paste the account ID from step 4]

### 6. Create Cloudflare Pages Project

**Option A: Via Cloudflare Dashboard (Recommended for first time)**

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com) → **Pages**
2. Click "Create a project" → "Connect to Git"
3. Authorize Cloudflare to access GitHub (if first time)
4. Select your repository: `cfc-presentation`
5. Configure build settings:
   - **Production branch:** `main`
   - **Build command:** (leave empty)
   - **Build output directory:** `/`
6. Click "Save and Deploy"
7. Wait for initial deployment to complete

**Option B: Via Wrangler CLI**

```bash
npm install -g wrangler
wrangler login
wrangler pages project create cfc-presentation --production-branch=main
```

### 7. Configure Custom Domain

1. In your Cloudflare Pages project, go to "Custom domains" tab
2. Click "Set up a custom domain"
3. Enter: `cfc.aisaiah.org`
4. Click "Continue"
5. Cloudflare will automatically:
   - Create a CNAME record in your DNS
   - Provision an SSL certificate
   - Configure HTTPS (takes ~24 hours max, usually minutes)

### 8. Verify Deployment

1. Wait for GitHub Action to run (check the "Actions" tab in your repo)
2. Once complete, visit: `https://cfc.aisaiah.org`
3. You should see your presentation live!

## CI/CD Workflow

Once set up, the workflow is simple:

```bash
# Make your changes locally
vim index.html

# Commit and push
git add .
git commit -m "Update presentation content"
git push origin main

# GitHub Actions automatically deploys to Cloudflare Pages
# Check progress: https://github.com/YOUR_USERNAME/cfc-presentation/actions
```

## Preview Deployments

For every pull request, Cloudflare Pages creates a unique preview URL:
- Format: `https://abc123.cfc-presentation.pages.dev`
- Perfect for reviewing changes before merging to production

## Troubleshooting

### Deployment fails with "API Token Invalid"
- Verify your `CLOUDFLARE_API_TOKEN` secret is correct
- Ensure the token has "Cloudflare Pages Edit" permissions

### Custom domain not working
- Check DNS propagation: `dig cfc.aisaiah.org`
- Verify the CNAME record points to your Pages project
- Wait up to 24 hours for SSL certificate provisioning

### GitHub Action doesn't trigger
- Ensure the workflow file is in `.github/workflows/deploy.yml`
- Check that you pushed to the `main` branch
- Verify GitHub Actions are enabled in your repository settings

## Manual Deployment (Alternative)

If you prefer to deploy without GitHub Actions:

```bash
# Install Wrangler CLI
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy manually
wrangler pages deploy . --project-name=cfc-presentation
```

## Links

- **Live Site:** https://cfc.aisaiah.org
- **Cloudflare Dashboard:** https://dash.cloudflare.com
- **GitHub Repository:** https://github.com/YOUR_USERNAME/cfc-presentation
- **Cloudflare Pages Docs:** https://developers.cloudflare.com/pages
