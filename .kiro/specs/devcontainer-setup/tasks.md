# Implementation Plan

- [ ] 1. Devcontainer基盤の構築
  - `.devcontainer/`ディレクトリを作成し、VS Codeが認識できる最小構成を用意する
  - `devcontainer.json`の`name`と`build.dockerfile`セクションを設け、Dockerfile参照によるビルドパイプラインを定義する
  - `Dockerfile`を追加してベースイメージに`mcr.microsoft.com/devcontainers/base:ubuntu`を採用する
  - _Requirements: 1.1, 2.1_
- [ ] 1.1 Node.js 24とpnpmフィーチャの有効化
  - `devcontainer.json`に`ghcr.io/devcontainers/features/node:1`を設定し、バージョン`24`を明示する
  - 同ファイルに`ghcr.io/devcontainers-contrib/features/pnpm:2`を追加し、Devcontainer初期化時にpnpmを提供する
  - Feature導入に伴う設定が正しく反映されるか`devcontainer features test`等で検証する
  - _Requirements: 1.1, 1.2_
- [ ] 1.2 推奨VS Code拡張の配備
  - `devcontainer.json`の`customizations.vscode.extensions`にBiom、Prettier、Jestなど設計で定義した拡張を列挙する
  - 既存の`.vscode/settings.json`やプロジェクト方針と整合が取れているか確認する
  - Devcontainer再接続後に拡張が自動インストールされることを手動テストで確認する
  - _Requirements: 1.3_

- [ ] 2. keytar依存ライブラリを含むDockerレイヤー整備
  - DockerfileでAPTキャッシュを更新し、インストール処理が失敗しないようにする
  - `libsecret-1-0`、`libsecret-1-dev`、`gnome-keyring`などkeytar依存のLinuxパッケージを追加する
  - 不要なAPTキャッシュを削除し、イメージサイズを最小限に保つ
  - _Requirements: 2.1, 2.2_
- [ ] 2.1 keytar動作検証
  - Devcontainerをビルド・起動し、`pnpm install`でkeytarがビルドされることを確認する
  - 簡易スクリプトで`keytar.setPassword`/`getPassword`を実行し、ネイティブモジュールがロードされることを検証する
  - 依存が不足している場合のエラーケースをREADMEにフィードバックする
  - _Requirements: 2.2, 3.2_

- [ ] 3. 依存関係インストール自動化の設定
  - `devcontainer.json`の`postCreateCommand`に`pnpm install`を設定する
  - 初回起動でコマンドが正常終了するか、Devcontainerログで終了コードを確認する
  - 失敗時のリトライやトラブルシューティングをREADME更新タスクに連携する
  - _Requirements: 3.1, 3.2_
- [ ] 3.1 pnpmワークスペース起動確認
  - Devcontainer上で`pnpm -v`と`node -v`を確認し、想定バージョンが提供されているか検証する
  - ワークスペースプロジェクトで`pnpm install`が成功し、lockfileが更新されないことを確認する
  - 追加依存が必要な場合は設計へフィードバックする
  - _Requirements: 1.1, 3.2_

- [ ] 4. Codex設定ディレクトリ共有の実装
  - `devcontainer.json`の`mounts`で`${localEnv:HOME}/.codex`を`/home/vscode/.codex`へバインドする設定を追加する
  - マウントが存在しない場合のフォールバック手順をREADME更新タスクへ共有する
  - 書き込みがホストに反映される点を運用注意として整理する
  - _Requirements: 5.1_
- [ ] 4.1 Codex CLI動作検証
  - Devcontainer内で`codex status`などを実行し、ホストと同じ認証状態を維持できるか確認する
  - `.codex`への設定変更がホスト側へ同期されることを確認する
  - 共有端末などマウントを避けたいケースの代替手順をREADME更新タスクへ連携する
  - _Requirements: 5.2_

- [ ] 5. README更新と最終検証
  - READMEにDevcontainer起動手順、前提条件、Codexディレクトリ共有方法、トラブルシューティングを追記する
  - 全タスクで得られた検証結果を反映し、利用者が手順通りに環境構築できるよう整備する
  - Devcontainerをクリーン状態で再構築し、要件を満たすことを総合的に確認する
  - _Requirements: 1.3, 3.1, 3.2, 4.1, 4.2, 5.1, 5.2_
