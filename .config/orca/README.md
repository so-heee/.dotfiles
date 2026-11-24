# Orca

Orca (com.stablyai.orca) の設定メモ。確認時のバージョン: v1.4.272（2026-11-24）

## 設定の保存場所

設定は JSON などのファイルではなく SQLite に保存されるため、現状はシンボリックリンクで管理しない。

- `~/Library/Application Support/orca/profiles/local-default/profile-state.db`（`settings` ドメイン）
- 同じディレクトリにはソケット・鍵・セッション DB も混在するため、dotfiles には入れない

ファイルで設定できるようになったら、このディレクトリに置いて `scripts/` からリンクする。

## インストール後に GUI で行う設定

| 設定箇所 | 項目（内部キー） | 既定値 | 設定する値 |
|---|---|---|---|
| Settings → Privacy | Share anonymous usage data (`telemetry.optedIn`) | オン（PostHog 米国へ送信） | オフ |
| Settings → Agents（新しい Agent → 権限） | 権限 (`agentPermissionDefault`, `nativeChatPermissionMode`) | `full-access`「フルアクセス」（Claude が `--dangerously-skip-permissions` 付きで起動した） | `ask`「承認を求める」 |
| Settings → Agents | Per-agent launch defaults の Arguments | — | 危険なフラグが入っていないか確認 |
| Settings → ブラウザ | Agent ブラウザの使用 | オフ | オフのまま（エージェントがログイン情報でブラウザを操作できなくなる） |
| Settings → ブラウザ | リンクルーティング | オフ | オフのまま（リンクは普段のブラウザで開く） |
| Settings → ブラウザ（下部） | 拡張機能 (`browserExtensionsEnabled`) | オン | オフ（ドキュメントの「Experimental」ではなくここにある） |
| Settings → ブラウザ（下部） | パスワードの保存を提案する / Cookie のインポート | オフ / 未インポート | 使わない |
| Settings → プロジェクト → `~` → 最下部「プロジェクトの削除」 | プロジェクト | 初回はホーム（`~`）が登録される | `~` を削除し、作業するリポジトリだけを登録（ファイルは消えない） |
| Settings → プロジェクト → 各プロジェクト | Agent のフォルダー信頼 | リポジトリを信頼 | Agent に確認させる |

日本語 UI では「承認を求める」を選ぶと両方が `ask` になる。エージェントごとの上書き（`agentPermissionOverrides`）は空のままにする。

## 運用ルール

- **テレメトリ**: GUI でオフにする。公式ドキュメントによると `DO_NOT_TRACK=1` / `ORCA_TELEMETRY_DISABLED=1` でも起動ごとに無効化できるが、Dock / Finder から起動した GUI アプリにはシェルの環境変数が渡らないため、GUI の設定を正とする。アカウント・Relay・共有・プラグインなどの通信はテレメトリとは別扱いで、これをオフにしても止まらない
- **内蔵ブラウザ**: 秘密情報を扱わない。ログインが必要なサイトを開かない（エージェントがブラウザを操作でき、Cookie もアプリ内に保存される）
- **Relay（クラウド中継）**: 使わない。Relay の有効/無効を切り替える項目は無く、Orca アカウントへのサインインが必要なため、サインインしないことで避ける。Settings → Artifacts の「Orca account」と、モバイルのペアリング（account / status メニュー）からサインインしない。Settings → Remote Orca Servers の「Advertise this app as a server」もオフのままにする

参考: [Privacy & Telemetry](https://orca.dev/docs/telemetry) / [Settings](https://orca.dev/docs/settings) / [Browser](https://orca.dev/docs/browser/overview) / [Mobile](https://orca.dev/docs/mobile)

## 設定値の確認方法

```sh
db="$HOME/Library/Application Support/orca/profiles/local-default/profile-state.db"
sqlite3 "file:$db?mode=ro" "select payload from profile_state_documents where domain='settings'" \
  | python3 -c 'import json,sys; d=json.load(sys.stdin); [print(k, d.get(k)) for k in ["agentPermissionDefault","nativeChatPermissionMode","browserExtensionsEnabled"]]; print("telemetry.optedIn", d["telemetry"]["optedIn"])'
```
