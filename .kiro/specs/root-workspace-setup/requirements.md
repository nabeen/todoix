# Requirements Document

## Project Description (Input)

docs/task/003-root-workspace-setup.md を対応して

## Requirements

todoix プロジェクトのルートに pnpm ワークスペース構成を整備し、共通スクリプトが即時に動作する状態を保証する。

### Requirement 1: ルート package.json の標準化

**Objective:** As a プロジェクトコントリビューター, I want ルート package.json がワークスペースの共通設定を提供する, so that チーム全体で同じコマンド体系を利用できる

#### Acceptance Criteria

1. WHEN 開発者がリポジトリ直下の package.json を読み込む THEN ルートワークスペース管理 SHALL `private: true` と `packageManager=pnpm@10.19.0` を宣言する
2. IF 開発者がルートで `pnpm run build` や `pnpm run test` を実行する THEN ルートワークスペース管理 SHALL 各スクリプトをワークスペース全体に対して委譲する
3. WHEN 新しい共通スクリプトが追加される THEN ルートワークスペース管理 SHALL コマンド名と説明を package.json の scripts に記載する
4. IF package.json に依存関係が定義される場合 THEN ルートワークスペース管理 SHALL 実装が不要な不要依存を含めない

### Requirement 2: pnpm ワークスペース構成の定義

**Objective:** As a リポジトリメンテナー, I want pnpm-workspace.yaml が対象パッケージを正しく列挙する, so that ワークスペース解決が期待通りに動作する

#### Acceptance Criteria

1. WHEN pnpm-workspace.yaml が読み込まれる THEN ワークスペース定義 SHALL `packages/*` を含む対象パスを宣言する
2. IF ワークスペースに新しいパッケージディレクトリが追加される THEN ワークスペース定義 SHALL 必要なパターンを pnpm-workspace.yaml に追記する
3. WHEN 開発者が `pnpm -r install` を実行する THEN ワークスペース定義 SHALL すべてのパッケージをスコープに含める
4. IF 除外すべきパスが存在する THEN ワークスペース定義 SHALL `packages` フォルダ外のディレクトリを意図せず含めない

### Requirement 3: ルート ignore ポリシーの整備

**Objective:** As a リポジトリメンテナー, I want .gitignore がワークスペース共通の生成物を除外する, so that 不要なファイルがコミットされない

#### Acceptance Criteria

1. WHEN 開発者が `pnpm install` やビルドを実行する THEN ignore ポリシー SHALL `node_modules` と `dist` 系ディレクトリを無視する
2. IF ルートに npm Lockfile やログが生成される THEN ignore ポリシー SHALL 既知の生成物（例: `pnpm-debug.log`）を除外する
3. WHEN 新たなワークスペースパッケージが追加される THEN ignore ポリシー SHALL 共通で除外すべき生成物があれば追記できるテンプレートを保持する
4. IF 開発者がローカルで一時ファイルを生成する THEN ignore ポリシー SHALL 一般的な IDE / エディタの一時ファイルを除外対象に含める
