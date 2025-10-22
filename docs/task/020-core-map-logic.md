# タスク: 020 Todoist→ドメインマッピング実装

## ゴール

- Todoist APIレスポンスを`Task`型に正規化する`map`モジュールを`packages/core`に実装する

## 作業内容

- `src/map.ts`を作成し、Todoistの未完了・完了タスクレスポンスを共通`Task`型に変換する関数を実装する
- プロジェクト・ラベル情報のネストやURLの生成など、必要なフィールドマッピングを行う
- 取得できないオプショナル情報（`project.name`など）は安全にフォールバックする
- 公開APIを`src/index.ts`経由でエクスポートする

## 完了条件

- Todoistレスポンスのサンプルから`Task`型へ正しく変換できる
- ビルドと型チェックが成功する

## 依存関係

- docs/task/014-types-domain-definitions.md
