# タスク: 018 タスク統合ロジック実装

## ゴール

- 未完了タスクと完了タスクを統合し、重複排除とソートを行う`merge`モジュールを`packages/core`に実装する

## 作業内容

- `src/merge.ts`を作成し、IDで重複を判定して最新情報を保持する処理を実装する
- 完了タスクには`completed: true`および`completed_at`を付与し、未完了タスクには`completed: false`を維持する
- 統合後のタスク配列を`created_at`昇順（または要件に沿った並び順）で並び替える
- 公開APIを`src/index.ts`経由でエクスポートする

## 完了条件

- 統合モジュールが要件通りのフィールドを保持した配列を返す
- 型チェックとビルドが成功する

## 依存関係

- docs/task/014-types-domain-definitions.md
- docs/task/010-core-package-scaffold.md
