# タスク: 016 時間ユーティリティ実装

## ゴール

- ローカルタイムゾーンのfrom/to入力をUTC境界に変換する`time`モジュールを`packages/core`に実装する

## 作業内容

- `src/time.ts`を作成し、`parseDateRange`, `toUtcRange`, `endOfDayInclusive`など必要な関数を実装する
- デフォルトタイムゾーン`Asia/Tokyo`を扱いつつ、設定から上書きできるようにする
- ローカル日時をUTCのISO文字列に変換する処理を追加する
- 公開APIを`src/index.ts`経由でエクスポートする

## 完了条件

- 実装が要件の境界条件（from/toともにローカル日付、終日の inclusive）を満たしている
- `pnpm -C packages/core build`で型チェックが通る

## 依存関係

- docs/task/010-core-package-scaffold.md
