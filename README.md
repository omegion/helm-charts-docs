# Helm Chart Docs

Centralized Helm Chart documentation page.

## Usage

```yaml
- name: Helm Chart Docs Github Pages
  uses: omegion/helm-charts-docs@v0.14.0
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
```

## Action Spec:

### Environment variables

- None

### Inputs

- `token`   - GitHub token.
- `branch`  - GitHub repository branch for pages.

### Outputs

- None

