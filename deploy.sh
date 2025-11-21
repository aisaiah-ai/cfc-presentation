#!/bin/bash

# Quick Deploy Script for AIsaiah CFC Presentation
# This script automates the initial Git setup and first deployment

set -e

echo "🚀 AIsaiah CFC Presentation - Deployment Setup"
echo "=============================================="
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Error: Git repository not initialized"
    echo "Run 'git init' first"
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "📝 Staging all files..."
    git add .
    
    echo "💾 Committing changes..."
    read -p "Enter commit message (or press Enter for default): " commit_msg
    if [ -z "$commit_msg" ]; then
        commit_msg="Update presentation"
    fi
    git commit -m "$commit_msg"
else
    echo "✅ No uncommitted changes"
fi

# Check if remote exists
if ! git remote get-url origin &> /dev/null; then
    echo ""
    echo "❓ No remote repository configured"
    echo ""
    echo "Please create a GitHub repository and run:"
    echo "  git remote add origin https://github.com/YOUR_USERNAME/cfc-presentation.git"
    echo "  git branch -M main"
    echo "  git push -u origin main"
    echo ""
    echo "Then follow the DEPLOYMENT.md guide to complete setup"
    exit 0
fi

# Push to remote
echo ""
echo "📤 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Code pushed successfully!"
echo ""
echo "Next steps:"
echo "1. Verify GitHub Action is running at: https://github.com/YOUR_USERNAME/cfc-presentation/actions"
echo "2. If this is your first deployment, follow DEPLOYMENT.md to:"
echo "   - Set up Cloudflare Pages"
echo "   - Configure GitHub Secrets"
echo "   - Add custom domain cfc.aisaiah.org"
echo ""
echo "📚 Read DEPLOYMENT.md for full instructions"
