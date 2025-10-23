#!/usr/bin/env bash
set -euo pipefail

ensure_codex_cli() {
  if command -v codex >/dev/null 2>&1; then
    echo "[codex] CLI already installed"
    return
  fi

  echo "[codex] Installing Codex CLI via npm"
  npm install -g @openai/codex
}

maybe_install_dependencies() {
  if [[ -f package.json || -f pnpm-workspace.yaml ]]; then
    echo "[pnpm] Installing workspace dependencies"
    pnpm install
  else
    echo "[pnpm] Skipped (no package.json or pnpm-workspace.yaml found)"
  fi
}

ensure_codex_cli
maybe_install_dependencies
