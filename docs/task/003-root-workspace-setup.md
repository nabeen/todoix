# タスク: 003 ルートワークスペース初期化

## ゴール

- pnpmマルチパッケージ構成を支えるルート`package.json`と`pnpm-workspace.yaml`を整備し、基本スクリプトが動く状態にする

## 作業内容

- ルート`package.json`を作成し、`private: true`、`packageManager: pnpm@9`、共通スクリプト(`build`/`dev`/`lint`/`test`)を定義する
- requirementsにあるルートスクリプトを反映し、必要なら`dev`などのコマンドを`pnpm -C`形式で設定する
- `pnpm-workspace.yaml`を作成し、`packages/*`を含むワークスペース範囲を定義する
- `.gitignore`に`node_modules`や`dist`など必要な項目を追記する

## 完了条件

- `pnpm -r build`などのルートコマンドがエラーなく実行できる
- ワークスペースに含めたいパッケージのパスが`pnpm-workspace.yaml`に登録されている
- 不要な依存や設定が含まれていないことを確認する

## 依存関係

- docs/task/002-node-pnpm-tooling.md
