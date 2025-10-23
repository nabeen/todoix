# todoix — requirements (MVP)

## Goal

- A **single-command CLI** (`todoix`) that launches a **TUI (Ink)**.
- In the TUI, the user selects a **date range (from–to)** interactively, or picks a **preset** (today / yesterday / thisweek / lastweek / thismonth).
- Fetch tasks **created** within the selected range from **Todoist**, include **both incomplete and completed** tasks, and **merge** them into one list for display.

---

## Non-Goals (MVP)

- No separate `fetch` command.
- No CLI flags for filters (project/label/priority/completed). These are roadmap items.
- No caching.
- No CSV/Table/Markdown outputs. **JSON-only** internally; the TUI renders from JSON.
- No Windows support (target = macOS + Linux).

---

## Tech Stack & Runtime

- **Runtime**: Node.js **24**
- **Lang**: TypeScript (strict)
- **Package manager**: pnpm (workspace)
- **CLI UI**: Ink (React)
- **HTTP**: Built-in `fetch`
- **Auth**: `keytar` (macOS/Linux)
- **Config**: `todoix.config.ts`（typed, optional）
- **Build**: `tsup` (ESM)
- **Test**: Vitest (+ ink-testing-library where needed)
- **Lint/Format**: **Biome**
- **CI**: GitHub Actions（lint / test / build / release）
- **Devcontainer**: Yes

---

## Command & UX

- **Run**: `npx todoix`（or `pnpm dlx todoix`）
- Launches **TUI** directly（no subcommands for MVP）.
- TUI flow:
  1) If token is missing → **prompt** to paste token → **store with keytar**.
  2) **Date selection**:  
     - **Preset picker**: today / yesterday / thisweek / lastweek / thismonth  
     - or **custom from–to** (calendar-like fields or ISO input)
  3) **Fetch** tasks created in the range (both incomplete & completed) → **merge** → render list.
  4) List operations:
     - ↑/↓: move cursor
     - **Enter**: show details panel
     - **/**: quick filter within loaded items (client-side)
     - **o**: open selected task in browser
     - **q**: quit

---

## Time & Range Semantics

- **Input/Display TZ**: local (default **Asia/Tokyo**; configurable)
- **Internal**: UTC
- **Boundary**: `from` **inclusive**, `to` **inclusive to end of day** in local time; convert to precise UTC instants for API.
- **Created range** = tasks whose **created_at** is within `[from_start_local, to_end_local]`.

---

## Data Handling

- **Sources**:
  - Incomplete tasks endpoint
  - Completed tasks endpoint (by creation date if supported; else fetch & filter by created_at, then merge)
- **Merging**:
  - Combine arrays; dedupe by task ID
  - Mark `completed` boolean and carry `completed_at` when present
- **Mapping** (normalized output shape for TUI):

```ts
type Task = {
  id: string;
  content: string;
  project: { id: string; name?: string };
  labels: { id: string; name?: string }[];
  priority: 1|2|3|4;
  created_at: string;     // ISO-8601 UTC
  completed: boolean;
  completed_at?: string;  // ISO-8601 UTC
  due?: { date?: string; datetime?: string; timezone?: string };
  url?: string;           // task URL
};
```

> **API specifics**（exact endpoints, pagination params, response keys, and task URL format）will be finalized during implementation using the latest Todoist docs.

---

## Errors & Retries

- **Retries**: 429/5xx with exponential backoff (max ~3 tries, total < 10s).
- **Display**: concise 1-line error in TUI status area; expandable details via a help/hint line if needed.

---

## Configuration (`todoix.config.ts`)

- Optional. Type-safe defaults override.
- Example:

```ts
import { defineConfig } from "todoix/config";

export default defineConfig({
  timezone: "Asia/Tokyo",
  pageSize: 100,  // tune to API pagination
  ui: {
    keybindings: { open: "o", quit: "q", search: "/" },
    listWidth: 120,
    wrapContent: true,
  },
});
```

---

## Repository Structure (pnpm workspace)

```text
todoix/
  package.json               # pnpm workspace root
  pnpm-workspace.yaml
  tsconfig.base.json
  biome.json
  .github/workflows/ci.yml
  .devcontainer/
    devcontainer.json
    Dockerfile
  packages/
    cli/                     # entry executable (bin), wires TUI
      package.json
      src/index.ts           # bin: resolves config, boots TUI
    ui/                      # Ink screens/components
      package.json
      src/App.tsx
      src/components/*
    core/                    # domain logic (time, merge, map)
      package.json
      src/time.ts
      src/merge.ts
      src/map.ts
    infra/                   # API client, keytar, config loader
      package.json
      src/todoist.ts         # fetch wrappers + pagination
      src/keytar.ts
      src/config.ts          # load ESM `todoix.config.ts`
    types/                   # shared types
      package.json
      src/index.ts
```

### Root `pnpm-workspace.yaml`

```yaml
packages:
  - "packages/*"
```

### Root `package.json` (excerpt)

```json
{
  "name": "todoix-monorepo",
  "private": true,
  "packageManager": "pnpm@9",
  "scripts": {
    "build": "pnpm -r build",
    "dev": "pnpm -C packages/cli dev",
    "lint": "biome check .",
    "test": "pnpm -r test"
  }
}
```

---

## Package Notes

### `packages/cli`

- **Build**: `tsup` → ESM single file
- **Bin**: `"bin": { "todoix": "dist/index.mjs" }`
- Responsibilities:
  - Resolve `todoix.config.ts`
  - Resolve token via keytar (prompt if missing)
  - Initialize Ink App with runtime deps (config, token, time helpers)

### `packages/ui`

- Ink components only.
- Props are pure JSON; no direct API calls.
- Minimal screens: `App` (date selection + list), `List`, `Detail`, `Footer`.

### `packages/core`

- Pure TS (no IO).
- `time.ts`: parse local from/to, end-of-day handling, UTC conversion.
- `merge.ts`: combine incomplete/completed arrays, dedupe, sort by `created_at`.
- `map.ts`: map raw API payloads to `Task`.

### `packages/infra`

- `todoist.ts`: `fetchIncompleteByCreatedRange`, `fetchCompletedByCreatedRange` (or closest supported), pagination, retries.
- `keytar.ts`: get/set/remove token.
- `config.ts`: load ESM `todoix.config.ts` with type guard.

### `packages/types`

- Shared `Task` and config interfaces + `defineConfig()` helper.

---

## Devcontainer

### `.devcontainer/devcontainer.json`

```json
{
  "name": "todoix",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "features": {
    "ghcr.io/devcontainers/features/node:1": {
      "version": "24"
    },
    "ghcr.io/devcontainers-extra/features/pnpm:2": {}
  },
  "postCreateCommand": "pnpm install",
  "customizations": {
    "vscode": {
      "extensions": [
        "biomejs.biome",
        "esbenp.prettier-vscode",
        "orta.vscode-jest"
      ]
    }
  }
}
```

### `.devcontainer/Dockerfile`

```dockerfile
# simple base; Node feature installs Node 24
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# keytar deps (libsecret etc.) for Linux
RUN apt-get update &&     apt-get install -y libsecret-1-0 gnome-keyring &&     rm -rf /var/lib/apt/lists/*
```

---

## Build & Release

- CLI package (`packages/cli`) publishes as `todoix`.
- `files` whitelist to include `dist/`.
- CI: lint → test → build → publish (Changesets recommended).

---

## Roadmap (Post-MVP)

- Filters in TUI（project/label/priority/completed toggle）
- Saved views
- CSV/Markdown export
- Separate `todoix fetch` for scripting
- Windows support（keytar代替/追加調査）
- Caching and offline view

---

## Open Items (Resolved During Implementation)

- Exact Todoist endpoints, pagination params, and response field names for created-range filtering (incomplete + completed).
- Official task URL schema to open a task in browser.
