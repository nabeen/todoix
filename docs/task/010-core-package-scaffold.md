# タスク: 010 `packages/core`スケルトン作成

## ゴール

- ドメインロジックを収める`packages/core`パッケージの構造を整え、ビルドとテストが可能な状態にする

## 作業内容

- `packages/core/package.json`を作成し、ESM設定・`dependencies`/`devDependencies`を定義する（`packages/types`への依存を追加）
- `tsconfig.json`を作成し、`references`で`packages/types`を利用する
- `src/`ディレクトリとプレースホルダーの実装ファイル（例: `src/index.ts`）を用意する
- `vitest`のサンプルテストを追加し、動作確認する

## 完了条件

- `pnpm -C packages/core test`が成功する
- ルート`tsconfig.json`の`references`に`packages/core`が追加されている

## 依存関係

- docs/task/009-types-package-scaffold.md
