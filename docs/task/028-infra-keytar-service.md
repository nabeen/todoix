# タスク: 028 Keytarトークンサービス実装

## ゴール

- Todoist APIトークンを安全に保存・取得・削除するKeytarラッパーを`packages/infra`に実装する

## 作業内容

- `src/keytar.ts`を作成し、`getToken`/`setToken`/`deleteToken`関数を実装する
- サービス名・アカウント名の命名を決め、環境変数などで上書きできるようにする（必要に応じて）
- Linux環境でのlibsecret依存を想定し、エラー時のメッセージをユーザーフレンドリーにする
- テストしやすいようにKeytarモジュールを依存注入またはモック可能な構造にする

## 完了条件

- トークンの保存・取得・削除がエラーなく行える
- Keytarが利用できない環境で適切なエラーが発生する

## 依存関係

- docs/task/011-infra-package-scaffold.md
