# Requirements Document

## Project Description (Input)

docs/task/002-node-pnpm-tooling.md を対応して

## Requirements

この仕様は todoix プロジェクトにおける Node.js 24.10.0 と pnpm 10.19.0 の利用を標準化し、開発者が統一環境で作業できるようにするための要件を定義する。リポジトリ直下でツールチェーンのバージョンが明示され、pnpm 利用が強制され、初回セットアップが迷わないことを目指す。

### Requirement 1: Node バージョン宣言の統一

**Objective:** As a プロジェクトコントリビューター, I want リポジトリが推奨 Node バージョンを明示する, so that ツール類が同じ Node ランタイムを利用できる

#### Acceptance Criteria

1. WHEN 開発者がリポジトリ直下の Node バージョン指定ファイルを確認する THEN Node ツールチェーン管理 SHALL Node 24.10.0 を一意に示す
2. IF 開発者が Node バージョンマネージャーを実行する THEN Node ツールチェーン管理 SHALL 推奨バージョン 24.10.0 へ切り替えるための互換ファイルを提供する
3. WHEN CI や Devcontainer などの自動化環境がバージョン指定ファイルを読み込む THEN Node ツールチェーン管理 SHALL Node 24.10.0 を取得できる形式で値を提示する
4. IF リポジトリ直下に Node バージョン指定ファイルが複数存在する THEN Node ツールチェーン管理 SHALL 全てのファイルで Node 24.10.0 を保持する

### Requirement 2: pnpm 設定の明示化

**Objective:** As a プロジェクトコントリビューター, I want リポジトリが pnpm 10.19.0 の設定を共有する, so that チーム全体で同じパッケージマネージャー挙動を再現できる

#### Acceptance Criteria

1. WHEN 開発者がパッケージマネージャー設定ファイルを確認する THEN pnpm 設定管理 SHALL pnpm 10.19.0 の利用を宣言する
2. WHEN パッケージマネージャーが `.npmrc` を読み込む THEN pnpm 設定管理 SHALL `package-manager=pnpm@10.19.0` を提示する
3. IF 開発者が pnpm コマンドを実行する THEN pnpm 設定管理 SHALL peer 依存の自動解決などの挙動がプロジェクト方針に従うよう設定値を提供する
4. WHEN CI や Devcontainer がパッケージマネージャー設定を読み込む THEN pnpm 設定管理 SHALL pnpm 10.19.0 を強制する

### Requirement 3: ツールチェーン利用手順の可視化

**Objective:** As a 新規参加開発者, I want Node と pnpm の準備手順を把握できる, so that 初回環境構築で迷わず作業を開始できる

#### Acceptance Criteria

1. WHEN 新規参加開発者が README を参照する THEN 開発ドキュメント SHALL 推奨 Node 24.10.0 と pnpm 10.19.0 を導入する手順を記載する
2. IF 開発者が CLI でバージョンを確認する必要がある THEN 開発ドキュメント SHALL `node -v` が `v24.10.0` であり `pnpm -v` が `10.19.0` である期待値を提示する
3. WHEN 開発者が Devcontainer など自動化環境を利用する THEN 開発ドキュメント SHALL 既存設定との整合方法を案内する
4. IF 開発者がローカルで pnpm をグローバルインストールしていない THEN 開発ドキュメント SHALL プロジェクト推奨の入手手段（例: `corepack` 有効化）を明示する
