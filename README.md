# todoix

## Devcontainer

VS Code Dev Containers を利用して、リポジトリの開発環境を統一できます。
推奨ツールチェーンは Node.js 24.10.0 と pnpm 10.19.0 です。

### 前提条件

- VS Code 本体
- Dev Containers 拡張
- Docker Desktop もしくは互換ランタイム
- ホスト側で `~/.codex` ディレクトリが存在し、Codex CLI が認証済みであること（未設定の場合は `codex login` を実行）

### 初回セットアップ

1. このリポジトリを VS Code で開き、左下の緑アイコンから「Dev Containers: Reopen in Container」を選択
2. コンテナ初期化後、`postCreateCommand` により `pnpm install` が自動実行されるので完了を待つ
3. `pnpm -v` と `node -v` を確認し、`10.19.0` / `v24.10.0` が返ることを確認
4. `codex status` を実行し、ホスト環境と同じ認証状態が維持されていることを確認

### トラブルシューティング

- keytar 関連のビルドエラーが出た場合はコンテナを再ビルドし、`libsecret-1-0` / `libsecret-1-dev` / `gnome-keyring` が導入されているか確認
- `pnpm install` が失敗する場合はネットワーク状態を確認し、必要に応じてコマンドを再実行
- 共有端末などで `.codex` をマウントしたくない場合は、Devcontainer 起動前に `devcontainer.json` の `mounts` セクションをコメントアウトし、コンテナ内で個別に `codex login` を実施

## ローカル環境でのセットアップ

Devcontainer を利用しない場合も、リポジトリ直下の `.node-version` / `.nvmrc` と `.npmrc` を用いて同じツールチェーンを再現できます。

1. Node バージョンマネージャー（asdf / nvm / Volta など）で `24.10.0` を切り替える（`.node-version` / `.nvmrc` 参照）
2. `corepack enable` を実行し Corepack を有効化したうえで、`corepack prepare pnpm@10.19.0 --activate` で pnpm を取得
3. `node -v` で `v24.10.0`、`pnpm -v` で `10.19.0` が表示されることを確認
4. 必要に応じて `pnpm install` を実行し依存関係を取得
