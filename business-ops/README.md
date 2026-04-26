# Green Infrastructure Services — Business Operations (Private Split)

This folder is the **split point** for business-operations content related to **Green Infrastructure Services**.

## Important
- This repository is public.
- Do **not** place sensitive or private business information directly in this repo.
- Use the split workflow below to publish this folder into a **separate private repository**.

## Initial setup (one time)
1. Create a new private GitHub repository (example: `green-infrastructure-services-ops`).
2. Add it as a remote in this repo:

```bash
git remote add gis-ops git@github.com:<your-org-or-user>/green-infrastructure-services-ops.git
```

3. Run the split script from repo root:

```bash
bash scripts/split-business-ops.sh
```

## Ongoing sync
After updates in `business-ops/`, re-run:

```bash
bash scripts/split-business-ops.sh
```

This pushes only the history/content under `business-ops/` to the private `gis-ops` repo.
