# タスク: 007 CIワークフロー整備

## ゴール

- GitHub ActionsでLint/Test/Buildが自動実行されるCIパイプラインを構築する

## 作業内容

- `.github/workflows/ci.yml`を作成し、Node 24とpnpmのセットアップ、`pnpm install`、`pnpm lint`、`pnpm test`、`pnpm build`を順番に実行するジョブを定義する
- pnpmキャッシュ（`PNPM_HOME`と`pnpm store`）を利用して実行時間を最適化する
- mainブランチへのpushとPRでワークフローが走るようトリガーを設定する

## 完了条件

- PR作成時にCIが自動で動作し、成功/失敗を判定できる
- Lint/Test/Buildの結果がGitHub上で確認できる

## 依存関係

- docs/task/003-root-workspace-setup.md
- docs/task/005-root-biome.md
- docs/task/006-root-vitest.md
