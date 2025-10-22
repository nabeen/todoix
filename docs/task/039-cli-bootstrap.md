# タスク: 039 CLIブートストラップ実装

## ゴール

- `packages/cli`でPNPM実行時にInkアプリを起動するエントリーポイントを実装し、設定・依存を初期化する

## 作業内容

- `src/index.ts`に`async`エントリーポイントを作成し、設定ローダー・keytar・UIを初期化するコードを書く
- CLI起動時にプロセス引数を検査し（MVPでは不要なサブコマンドは拒否）、単一コマンド起動を保証する
- `tsup`ビルド後の`dist/index.mjs`からInkアプリが起動することを確認する

## 完了条件

- `pnpm -C packages/cli dev`や`pnpm dlx ./dist/index.mjs`でTUIが立ち上がる
- エントリーポイントで未使用の引数がある場合に警告するなど、UXが整っている

## 依存関係

- docs/task/026-infra-config-loader.md
- docs/task/028-infra-keytar-service.md
- docs/task/037-ui-app-compose.md
