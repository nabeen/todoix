# タスク: 023 未完了タスク取得関数実装

## ゴール

- Todoistの未完了タスクを作成日時レンジで取得する`fetchIncompleteByCreatedRange`関数を実装する

## 作業内容

- `src/todoist.ts`に`fetchIncompleteByCreatedRange`を追加し、HTTPクライアント基盤を利用してAPIを呼び出す
- ページネーションを考慮し、`pageSize`設定に従って繰り返し取得する
- APIレスポンスの生データを返却し、後続の`map`処理に渡せる形に整える
- 429/5xxなどのリトライは基盤に任せつつ、予期しないレスポンス構造には例外を投げる

## 完了条件

- 指定した日時レンジで必要な未完了タスクデータを取得できる
- ページネーションが完了するまでデータを集約して返す

## 依存関係

- docs/task/022-infra-http-client.md
