# タスク: 014 ドメイン型定義作成

## ゴール

- 要件に沿った`Task`型と設定インターフェースを`packages/types`に定義し、他パッケージで利用できるようにする

## 作業内容

- `Task`型・`Project`型・`Label`型など必要な型エイリアスを`src/task.ts`（または`index.ts`）に実装する
- 設定用の`TodoixConfig`インターフェースと`defineConfig`ヘルパーの宣言を追加する
- 必要なユーティリティ型（例: `DateRangePreset`など）を定義し、エクスポートする
- `packages/cli`や`packages/ui`で利用予定の型を見据え、命名と構造を調整する

## 完了条件

- `packages/types`でエクスポートされる型が要件ドキュメントの構造と一致している
- 型の分割とエクスポートが整理されており、他パッケージから型が参照できる

## 依存関係

- docs/task/009-types-package-scaffold.md
