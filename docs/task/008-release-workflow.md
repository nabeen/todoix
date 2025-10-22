# タスク: 008 リリースパイプライン整備

## ゴール

- Changesetsを用いたバージョン管理と公開フローを導入し、CIからのリリース自動化を可能にする

## 作業内容

- `@changesets/cli`をルートに追加し、`pnpm changeset init`で設定ファイルを生成する
- ルート`package.json`に`release`スクリプト（`changeset version`→`pnpm -r build`→`changeset publish`など）を定義する
- `.github/workflows/release.yml`を作成し、`changesets/action`でPRマージ時にリリースPRを作成＆publishするワークフローを構築する
- npmトークンなど必要なシークレットをREADMEまたはリポジトリ設定メモに記載する（シークレット値は追加しない）

## 完了条件

- `pnpm changeset`でバージョン管理フローを開始できる
- mainブランチに変更が入った際にChangesetsのリリースPRが自動生成される
- 手動／自動でreleaseワークフローを走らせると`packages/cli`が公開される準備が整う

## 依存関係

- docs/task/003-root-workspace-setup.md
- docs/task/007-ci-workflow.md
