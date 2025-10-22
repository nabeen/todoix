# タスク: 006 Vitest設定導入

## ゴール

- ルートでVitestを設定し、各パッケージが共通のテスト環境（Node＋jsdom）を利用できるようにする

## 作業内容

- ルートに`vitest.config.ts`を作成し、ESM対応・TypeScriptパス解決・テストごとのタイムアウトなどを設定する
- `test`スクリプトを`pnpm -r test`で実行できるよう確認し、必要に応じて`--runInBand`などのオプションを調整する
- TUIテスト向けに`ink-testing-library`利用時の環境（`jsdom`）が利用できるように設定する

## 完了条件

- `pnpm test`実行でベースとなるサンプルテストが通る
- 今後追加する各パッケージのテストがルート設定を継承できる

## 依存関係

- docs/task/004-root-tsconfig.md
