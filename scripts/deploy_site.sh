#!/usr/bin/env bash
set -e

REPO_NAME="${1:-motivelayer-site}"

echo "========================================="
echo " Deploying MotiveLayer Launch Kit & Site"
echo "========================================="

if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "Error: Not logged in to GitHub CLI. Run 'gh auth login' first."
    exit 1
fi

echo "Creating GitHub repository: $REPO_NAME (public)..."
if gh repo view "$REPO_NAME" &> /dev/null; then
    echo "Repository $REPO_NAME already exists. Pushing main branch..."
    git push -u origin main
else
    gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
    echo "Repository created and pushed successfully!"
fi

echo ""
echo "Next step for GitHub Pages:"
echo "1. Visit: https://github.com/$(gh api user -q .login)/$REPO_NAME/settings/pages"
echo "2. Under 'Source', choose 'GitHub Actions'"
echo "3. The deployment workflow will automatically publish your site to:"
echo "   https://$(gh api user -q .login).github.io/$REPO_NAME/"
echo "========================================="
