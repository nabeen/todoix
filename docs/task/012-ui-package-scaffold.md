# タスク: 012 `packages/ui`スケルトン作成

## ゴール

- Inkコンポーネント群を配置する`packages/ui`パッケージの土台を作り、React/Inkがビルドできる状態にする

## 作業内容

- `packages/ui/package.json`を作成し、`react`・`ink`・`ink-testing-library`など必要な依存を追加する
- `tsconfig.json`を作成し、`packages/types`への参照とJSX設定を行う
- `src/`配下に仮の`App`コンポーネントを置き、エクスポートする
- Ink用のテストサンプルを追加し、`vitest`と`ink-testing-library`の組み合わせが動作することを確認する

## 完了条件

- `pnpm -C packages/ui test`が成功する
- ルート`tsconfig.json`の`references`に`packages/ui`が追加されている

## 依存関係

- docs/task/009-types-package-scaffold.md
