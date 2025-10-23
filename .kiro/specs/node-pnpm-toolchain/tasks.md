# Implementation Plan

- [ ] 1. Node 24.10.0 バージョン宣言を整備する

  - `.node-version` と `.nvmrc` を新規追加し、両方で `24.10.0` を宣言して重複のないフォーマットに整える
  - Devcontainer や将来の CI がバージョン指定ファイルを検出できるように、既存スクリプトや設定との整合を確認する
  - バージョン更新時に両ファイルの差分を自動検出できる仕組み（lint またはスクリプト）の追加可否を検討し、実現可能であれば最小限で導入する
  - _Requirements: 1.1, 1.2, 1.3, 1.4_

- [ ] 1.1 Node バージョン検証テストを実装する

  - `tests/toolchain/test_toolchain_versions.py`（仮称）を追加し、`.node-version` と `.nvmrc` の内容一致と `24.10.0` 固定を検証する
  - Devcontainer など自動化環境でもテストが実行されるようにテストランナー設定へ組み込む
  - バージョン不一致時に明確なメッセージを出力して開発者が即時修正できるようにする
  - _Requirements: 1.1, 1.2, 1.3, 1.4_

- [ ] 2. pnpm 10.19.0 の設定を導入する

  - `.npmrc` を追加し `package-manager=pnpm@10.19.0` を定義して Corepack での解決に対応させる
  - 既存の Devcontainer post-create スクリプトや今後の CI で設定が読み込まれるか確認し、必要に応じてパスや実行順序を調整する
  - Corepack を利用しない環境での fallback（手動 `corepack enable` など）を README 更新タスクへ連携できるよう準備する
  - _Requirements: 2.1, 2.2, 2.3, 2.4_

- [ ] 2.1 pnpm 設定検証テストを実装する

  - `tests/toolchain/test_toolchain_versions.py` もしくは同等のテストに `.npmrc` の `package-manager` 値が `pnpm@10.19.0` であるかの検証を追加する
  - Corepack が参照する設定ファイル位置をテストで確認し、意図しない読み飛ばしが発生しないようにする
  - pnpm バージョンが将来更新された際にテストが即座に検知できるメッセージと保守手順を整備する
  - _Requirements: 2.1, 2.2, 2.3, 2.4_

- [ ] 3. 開発者向けツールチェーンガイドを整備する

  - README に Node 24.10.0 / pnpm 10.19.0 の導入手順、`corepack enable` の手順、`node -v` と `pnpm -v` の期待出力を追記する
  - Devcontainer 以外のローカル環境での設定手順を簡潔にまとめ、既存セクションとの重複を避ける
  - `.devcontainer/post-create.sh` の挙動と記載内容に齟齬がないか確認し、必要であれば Corepack を利用したバージョン固定処理を追加する
  - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [ ] 3.1 README ガイドのテストと整合性チェックを追加する
  - ドキュメントに記載したバージョン文字列が最新値と一致しているかを静的チェックする簡易スクリプトを実装する
  - テストスイートまたは CI にガイド整合性チェックを組み込み、ドキュメントのドリフトを防止する
  - Corepack 未使用環境でのトラブルシューティング手順を README に反映済みかをチェックリスト化してレビューで活用できるようにする
  - _Requirements: 3.1, 3.2, 3.3, 3.4_
