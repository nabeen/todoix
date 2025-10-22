# タスク: 005 Biome設定導入

## ゴール

- プロジェクト全体でBiomeを用いたLint/Formatが実行できるよう設定ファイルとスクリプトを整備する

## 作業内容

- ルートに`biome.json`（もしくは`biome.jsonc`）を作成し、TypeScript/JSON/Markdownに対するLintとFormatルールを定義する
- Biomeが無視すべきディレクトリ（`dist`や`coverage`など）を`biome.json`や`.biomeignore`で設定する
- ルート`package.json`の`scripts`に`"lint": "biome check ."`が登録されていることを確認し、必要なら`format`スクリプトも追加する

## 完了条件

- `pnpm lint`が成功し、不要なファイルがLint対象になっていない
- Biome設定がチーム合意のルールを反映している

## 依存関係

- docs/task/003-root-workspace-setup.md
