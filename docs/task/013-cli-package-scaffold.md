# タスク: 013 `packages/cli`スケルトン作成

## ゴール

- `todoix`コマンド本体を提供する`packages/cli`パッケージの基本構造を整え、ビルドで単一ファイルのESMが生成される状態にする

## 作業内容

- `packages/cli/package.json`を作成し、`bin`設定で`todoix`を`dist/index.mjs`に紐づける
- `tsconfig.json`を作成し、`packages/types`・`packages/core`・`packages/infra`・`packages/ui`への参照を設定する
- `tsup`設定ファイル（例: `tsup.config.ts`）を追加し、ESM単一ファイル出力を構成する
- 仮のエントリーファイル`src/index.ts`を準備して`console.log`程度の動作確認を行う

## 完了条件

- `pnpm -C packages/cli build`で`dist/index.mjs`が生成される
- `pnpm -C packages/cli dev`（必要なら）でウォッチビルドが動作する

## 依存関係

- docs/task/011-infra-package-scaffold.md
- docs/task/012-ui-package-scaffold.md
