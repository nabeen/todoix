# タスク: 041 データ取得パイプライン実装

## ゴール

- CLIで設定・日時レンジからTodoist APIを呼び出し、`merge`/`map`を通してUIへ渡す非同期フローを完成させる

## 作業内容

- 状態モデルからレンジ変更イベントを受け取り、`packages/infra`の取得関数を呼び出す処理を追加する
- 取得したデータを`packages/core`の`map`と`merge`で正規化してからUIに渡す
- フェッチ中はローディング状態、完了後にリスト更新、エラー時には状態モデルへエラーを通知する

## 完了条件

- UIでレンジを変更するとAPIが呼ばれ、タスク一覧が更新される
- 完了タスクと未完了タスクが統合され、正しい表示順でUIへ渡される

## 依存関係

- docs/task/020-core-map-logic.md
- docs/task/023-infra-fetch-incomplete.md
- docs/task/024-infra-fetch-completed.md
