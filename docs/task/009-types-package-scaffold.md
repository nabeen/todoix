# タスク: 009 `packages/types`スケルトン作成

## ゴール

- 共有型定義を配置する`packages/types`パッケージの骨組みを用意し、他パッケージから参照できるようにする

## 作業内容

- `packages/types/package.json`を作成し、`type: module`、`exports`、`types`、`build`スクリプト（必要なら）を設定する
- `tsconfig.json`を作成し、ルート`tsconfig.base.json`を継承させる
- エントリーファイル（例: `src/index.ts`）を作り、仮の型定義とエクスポートを記述する
- `vitest`用のプレースホルダーテストファイルを追加する

## 完了条件

- `pnpm -C packages/types build`（またはtsc）で型ファイル生成が成功する
- ルート`tsconfig.json`の`references`に`packages/types`が追加されている

## 依存関係

- docs/task/004-root-tsconfig.md
