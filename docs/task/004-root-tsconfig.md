# タスク: 004 ルートTypeScript設定整備

## ゴール

- 全パッケージで共通利用する厳格なTypeScript設定を整え、個別パッケージの`tsconfig`から参照できるようにする

## 作業内容

- `tsconfig.base.json`をルートに作成し、`strict: true`やESMターゲット、`moduleResolution: bundler`など必要なコンパイラオプションを定義する
- ルート`tsconfig.json`で`references`を有効化し、後続で追加する各パッケージの`tsconfig`を参照できるように準備する
- 既存／予定のディレクトリ構成に合わせて`paths`や`exclude`を調整する

## 完了条件

- `pnpm tsc --showConfig`で共通設定が適用されることが確認できる
- 各パッケージが共通設定を継承できる状態になっている

## 依存関係

- docs/task/003-root-workspace-setup.md
