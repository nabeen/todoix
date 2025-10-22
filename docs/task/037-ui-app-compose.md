# タスク: 037 Appコンポーネント統合

## ゴール

- 状態モデルと個別UIコンポーネントを統合し、TUI全体のレイアウトとイベント連携を完成させる

## 作業内容

- `packages/ui`の`App`コンポーネントでプリセットピッカー・日付入力・タスクリスト・詳細・検索・フッターを配置する
- 状態モデルのアクションを各コンポーネントに渡し、イベントフローを確立する
- レイアウトを要件に沿って調整し、リサイズ時の挙動を確認する

## 完了条件

- Inkで`App`をレンダリングした際に全コンポーネントが連携して動作する
- イベント伝播（選択・検索・エラー表示）が期待通り機能する

## 依存関係

- docs/task/031-ui-preset-picker.md
- docs/task/032-ui-custom-date-input.md
- docs/task/033-ui-task-list.md
- docs/task/034-ui-task-detail.md
- docs/task/035-ui-footer-status.md
- docs/task/036-ui-search-overlay.md
