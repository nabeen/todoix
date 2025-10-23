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

ensure_pnpm_version() {
  if command -v corepack >/dev/null 2>&1; then
    echo "[corepack] Preparing pnpm@10.19.0"
    corepack prepare pnpm@10.19.0 --activate
  else
    echo "[corepack] corepack が見つかりません。pnpm@10.19.0 を手動でインストールしてください。"
  fi
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
ensure_pnpm_version
maybe_install_dependencies
