# タスク: 002 Node/Pnpmツールチェーン整備

## ゴール

- Node.js 24とpnpm 9をチームで統一運用できるよう、リポジトリにバージョン固定ファイルと設定を整備する

## 作業内容

- `.node-version`（もしくは`.nvmrc`）にNode 24系のバージョンを記載する
- `.npmrc`で`package-manager=pnpm@9`などpnpm利用を明示し、`auto-install-peers=false`など必要な設定を行う
- `pnpm`でグローバルインストール不要にするためのREADME追記（任意）

## 完了条件

- `node -v`で指定バージョンが分かるファイルがリポジトリ直下に存在する
- pnpm利用を明示する`.npmrc`が追加されている
- 新規開発者がバージョン迷いなく環境を準備できるようになっている

## 依存関係

- docs/task/001-devcontainer-setup.md
