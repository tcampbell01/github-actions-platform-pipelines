# github-actions-platform-pipelines# 

A template repo showing how to standardize CI/CD across teams using GitHub Actions.

## What it shows
- **Platform thinking**: one reusable CI workflow teams can consume
- **Automation mindset**: dependency review, CodeQL, publish on tags
- **Developer experience**: fast PR feedback, clear adoption steps

## Core features
- GitHub Actions workflows:
  - Build + Test (reusable workflow)
  - Dependency scanning (Dependency Review + CodeQL)
  - Artifact publishing (publish container image to GHCR on version tags)
- Reusable workflow via `workflow_call`
- PR vs main separation

## How teams adopt this
1. Copy `.github/workflows/*` into your repo (or use it as a template repo).
2. Keep your repo-specific build/test logic inside the reusable workflow steps (or call `make test`).
3. Standardize secrets and publishing policy via org-level conventions.

See: `docs/adoption-guide.md`

## Pipeline overview

```mermaid
flowchart TD
  PR[Pull Request] --> DR[Dependency Review]
  PR --> CI[Reusable CI: lint + test]
  Main[Push to main] --> CI2[Reusable CI: lint + test]
  Main --> CQ[CodeQL]
  Tag[Tag vX.Y.Z] --> PUB[Publish image to GHCR]
