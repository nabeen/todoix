# Implementation Plan

- [ ] 1. ルート package.json を整備する

  - `package.json` を生成し、`name`, `private: true`, `packageManager=pnpm@10.19.0`, `engines.node=24.10.0` を定義する
  - `build`, `dev`, `lint`, `test` など共通 scripts を追加し、`pnpm -r` や `pnpm -C` を用いてワークスペース全体へ委譲する
  - scripts の説明コメントや README の既存ガイドと矛盾しないようにコマンド名称・期待動作を確認する
  - _Requirements: 1.1, 1.2, 1.3, 1.4_

- [ ] 1.1 ルート package.json の検証テストを追加する

  - `tests/toolchain/test_root_workspace.py`（仮称）を作成し、package.json に必須フィールドと scripts が存在するか検証する
  - JSON スキーマ違反や想定外の依存が含まれていないかをテストで確認する
  - scripts 実行時の委譲先コマンドが要件と一致しているかを文字列検査で保証する
  - _Requirements: 1.1, 1.2, 1.3, 1.4_

- [ ] 2. pnpm-workspace.yaml を定義する

  - `pnpm-workspace.yaml` を追加し、`packages/*` を基本とした対象パスを記述する
  - 今後追加されるサブディレクトリ（例: `apps/*`, `packages/*` など）を想定したコメントやプレースホルダを用意する
  - ファイルフォーマット（YAML インデント、改行）が pnpm の仕様に沿っているか lint/テストで検証する
  - _Requirements: 2.1, 2.2, 2.3, 2.4_

- [ ] 2.1 ワークスペース構成の検証テストを追加する

  - `test_root_workspace.py` に pnpm-workspace.yaml を読み込み、期待パターン（`packages/*`）が含まれることを確認するテストを実装する
  - 意図しないディレクトリが含まれていないかをリスト化し、将来的に検証しやすい仕組みを整える
  - `pnpm -r env use --dry-run` 相当のチェックをテストでシミュレートし、解決範囲が満たされるかを検証する
  - _Requirements: 2.1, 2.2, 2.3, 2.4_

- [ ] 3. `.gitignore` を更新しワークスペース生成物を除外する

  - 既存 `.gitignore` を確認し、`node_modules/`, `dist/`, `pnpm-lock.yaml`, `*.log`, `.DS_Store` など共通除外ルールを追加する
  - packages 配下で生成されるビルド成果物（`packages/*/dist` 等）も個別に除外し、漏れが無いようにする
  - 追加した除外項目が README の運用ルールと矛盾しないかレビューする
  - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [ ] 3.1 ignore ポリシーの検証テストを追加する
  - `test_root_workspace.py` に `.gitignore` 必須パターンを検証するテストを実装し、除外漏れを検知する
  - 一般的な IDE や OS の一時ファイルが除外されているかをテストで確認する
  - 将来の追加除外項目に備え、テストを簡単に拡張できるようデータ駆動で実装する
  - _Requirements: 3.1, 3.2, 3.3, 3.4_
