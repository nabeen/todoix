# タスク: 001 Devcontainer環境整備

## ゴール

- requirementsに沿った`.devcontainer/devcontainer.json`と`Dockerfile`を用意し、開発コンテナでpnpmワークスペースが即利用できる状態にする

## 作業内容

- `.devcontainer/`ディレクトリを作成し、`devcontainer.json`を作成する
- Node 24とpnpmフィーチャ、推奨VS Code拡張、`postCreateCommand: pnpm install`を設定する
- `Dockerfile`を作成し、libsecretやgnome-keyringなどkeytar依存のLinuxパッケージを追加する
- 必要に応じてREADMEにDevcontainerの起動手順を追記する

## 完了条件

- Devcontainerで起動後に`pnpm install`がエラーなく完了する
- `devcontainer.json`が要件どおりの設定（Node24/pnpm/extensions/postCreateCommand）になっている
- `Dockerfile`にkeytarが動作するための依存パッケージが含まれている

## 依存関係

- なし
