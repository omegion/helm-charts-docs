# Helm Chart Docs

Centralized Helm Chart documentation page.

## Usage

```yaml
- name: Helm Chart Docs Github Pages
  uses: omegion/helm-charts-docs@v0.15.0
  with:
    helmRepository: omegion
    helmRepositoryUrl: https://charts.omegion.dev
    token: ${{ secrets.GITHUB_TOKEN }}
```

## Action Spec:

### Environment variables

- None

### Inputs

- `token`   - GitHub token.
- `branch`  - GitHub repository branch for pages.
- `helmRepository`  - Helm chart repository name to be shown on hero.
- `helmRepositoryUrl`  - Helm chart repository url to be shown on hero, usually GitHub pages url.

### Outputs

- None

