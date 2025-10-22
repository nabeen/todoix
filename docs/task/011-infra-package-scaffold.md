# タスク: 011 `packages/infra`スケルトン作成

## ゴール

- Todoist APIやKeytarなど外部I/Oを担当する`packages/infra`パッケージの骨組みを整備する

## 作業内容

- `packages/infra/package.json`を作成し、`fetch`ポリフィルや`keytar`など必要な依存を追加する
- `tsconfig.json`を作成し、`packages/types`と`packages/core`への参照を設定する
- `src/`ディレクトリとプレースホルダーのエントリーファイル（例: `src/index.ts`）を用意する
- `vitest`のサンプルテストを追加し、モックを使った外部依存呼び出しのテストができるよう準備する

## 完了条件

- `pnpm -C packages/infra test`が成功する
- ルート`tsconfig.json`の`references`に`packages/infra`が追加されている

## 依存関係

- docs/task/010-core-package-scaffold.md
