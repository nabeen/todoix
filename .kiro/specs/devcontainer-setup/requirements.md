# Requirements Document

## Introduction

Devcontainer環境を標準化し、Node.js 24とpnpmワークスペースを即時利用できる状態を保証するための要求を定義する。

## Requirements

### Requirement 1: Devcontainer構成の標準化

**Objective:** As a プロジェクトコントリビューター, I want 統一されたDevcontainer設定を利用できる, so that チーム全体が同じ開発基盤で作業できる

#### Acceptance Criteria

1. WHEN 開発者がVS Code Dev Containersでリポジトリを開く THEN Devcontainer設定 SHALL Node.js 24.xランタイムを提供する
2. WHEN Devcontainerが起動初期化を行う THEN Devcontainer設定 SHALL pnpmフィーチャを有効化する
3. IF Devcontainer設定が読み込まれる THEN Devcontainer設定 SHALL 推奨VS Code拡張を`devcontainer.json`に列挙する

### Requirement 2: 依存パッケージを備えたコンテナイメージ

**Objective:** As a プロジェクトコントリビューター, I want keytar依存パッケージを含むDockerイメージを利用できる, so that セキュアストレージ機能をpnpmワークスペースで動作させられる

#### Acceptance Criteria

1. WHEN Dockerfileがビルドされる THEN コンテナイメージ SHALL `libsecret-1-0`・`libsecret-1-dev`・`gnome-keyring`などkeytarに必要なLinuxパッケージをインストールする
2. IF コンテナがpnpmワークスペースでkeytarをビルドする THEN コンテナイメージ SHALL 必要なヘッダとランタイムライブラリを提供する

### Requirement 3: 依存関係インストールの自動化

**Objective:** As a プロジェクトコントリビューター, I want Devcontainer初回起動時に依存関係が自動インストールされる, so that 作業開始前の手動セットアップを不要にできる

#### Acceptance Criteria

1. WHEN Devcontainerの初期化が完了する THEN Devcontainerライフサイクル SHALL `postCreateCommand`で`pnpm install`を実行する
2. IF `pnpm install`が実行される THEN Devcontainerライフサイクル SHALL 終了ステータス0を報告する

### Requirement 4: 利用手順の文書化

**Objective:** As a 新規参加開発者, I want Devcontainer起動手順を参照できる, so that 開発環境を迷わず再現できる

#### Acceptance Criteria

1. WHEN READMEが更新される THEN プロジェクトドキュメンテーション SHALL Devcontainer拡張のインストールとコンテナ起動手順を記載する
2. IF 開発者がREADMEのDevcontainer手順に従う THEN プロジェクトドキュメンテーション SHALL 必要な前提条件と操作手順を提供する

### Requirement 5: Codex設定ディレクトリの共有

**Objective:** As a プロジェクトコントリビューター, I want Devcontainer内でCodex CLI設定一式を再設定せずに利用できる, so that ホスト環境と同じAI支援フローを維持できる

#### Acceptance Criteria

1. IF ホスト環境に`.codex`ディレクトリが存在する THEN Devcontainer構成 SHALL ディレクトリ全体を開発者ホームディレクトリ配下へ読み書き可能なマウントとして提供する
2. WHEN 開発者がDevcontainer内でCodex CLIを実行する THEN Devcontainer環境 SHALL ホスト由来の`.codex`ディレクトリから認証情報および設定を読み書きし、追加の手動設定無しでコマンドを実行できる
