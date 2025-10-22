# タスク: 015 設定型ヘルパーの検証テスト追加

## ゴール

- `defineConfig`や設定型が正しく型推論されることをテストで保証する

## 作業内容

- `packages/types`に`defineConfig`用の型テストを追加する（`vitest`＋`expectTypeOf`もしくは`tsd`を使用）
- 正常系（全項目設定）と部分的設定（オプショナル項目）の推論結果を確認するテストケースを作成する
- 型エラーになるべき入力が型レベルで検出されることを確認する

## 完了条件

- `pnpm -C packages/types test`で型関連テストが成功する
- 誤った設定値を渡した場合に型エラーで検知できることを確認できている

## 依存関係

- docs/task/014-types-domain-definitions.md
