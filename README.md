# dotfiles

- macOS (Homebrew) とWindows (WinGet) の両方に対応
- common（共通）、work（仕事用）、personal（個人用）の3つのカテゴリでパッケージを管理

## 初期セットアップ

### Homebrewをインストール（macOSのみ）

初期状態のmacOSにはHomebrewが入っていないため、先にインストールする。

```Bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Apple Silicon Macの場合は、インストール後にPATHを通す。

```Bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

インストールできたか確認する。

```Bash
brew --version
```

### chezmoiをインストール

以下のコマンドを実行して`chezmoi`をインストール

#### macOSの場合

```Bash
brew install chezmoi
```

#### Windowsの場合

```PowerShell
winget install twpayne.chezmoi
```

### dotfilesの初期化と適用

以下のコマンドを実行する。`email`・`name`・`role`は引数で渡すためプロンプトは表示されない。
`init`はclone→設定ファイル生成→適用の順に実行される。

```Bash
chezmoi init --apply katsu996/dotfiles --promptString email=firstname.lastname@example.com,name=firstname.lastname,role=work
```

`role`は**workまたはpersonal**のいずれかを指定する。設定ファイルを確認する。

```Bash
cat ~/.config/chezmoi/chezmoi.toml
```

引数を省略した場合は対話式プロンプト（`email`・`name`・`role`）が表示される。

#### `map has no entry for key "role"`が出る場合

原因は`~/.config/chezmoi/chezmoi.toml`の`[data]`に`role`が無いこと。
すでにinit済みの環境では、リポジトリを更新して`chezmoi init`を再実行すると設定ファイルを作り直せる。

```Bash
chezmoi update
chezmoi init --promptString email=firstname.lastname@example.com,name=firstname.lastname,role=work
cat ~/.config/chezmoi/chezmoi.toml
```

プロンプトが表示されない場合は手動で作り直す。
`~/.config/chezmoi`ディレクトリが存在しないと`No such file or directory`になるため、先に`mkdir -p`を実行する。

```Bash
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
[data]
    email = "firstname.lastname@example.com"
    name = "firstname.lastname"
    role = "work"
EOF
```

`role`は**workまたはpersonal**のいずれかを入力する。作成できたか確認する。

```Bash
cat ~/.config/chezmoi/chezmoi.toml
```

確認後に再適用する。

```Bash
chezmoi apply
```

### chezmoiの日常的な使用

環境を最新の状態に保つために、変更があった場合は適宜以下のコマンドを実行する。

#### リモートリポジトリのプル

ローカルリポジトリをリモートリポジトリの内容で更新する。

```bash
chezmoi update
```

#### 差分の確認

ローカルリポジトリと現在の環境の差異を確認できる。

```bash
chezmoi diff
```

#### 最新状態への更新

リポジトリの最新の変更をプルし、ホームディレクトリに適用する。

```bash
chezmoi update --apply

or

chezmoi update
chezmoi apply
```

## 開発環境

| 項目                   | Windows            | Mac                |
| ---------------------- | ------------------ | ------------------ |
| シェル                 | clink              | zsh                |
| ターミナル             | Windows Terminal   | Ghostty            |
| エディタ               | Cursor<br>Zed      | Cursor<br>Zed      |
| ウィンドウマネージャー | -                  | Rectangle + AltTab |
| プロンプト             | Starship           | Starship           |
| パッケージマネージャー | WinGet<br>UnigetUI | Homebrew           |
| バージョンマネージャー | mise               | mise               |
| ブラウザ               | Chrome             | Chrome             |
| 開発ツール             | Notion             | Notion             |
| ランチャー             | Raycast            | Raycast            |
| Docker                 | Docker Desktop     | OrbStack           |
| DBツール               | A5:SQL Mk-2        | Sequel Ace         |

## ディレクトリ構成

`.chezmoiroot` が `home` のため、chezmoi のソースルートは `home/`。
`other_dot_config/` と `settingBackup/` は chezmoi 管理外の手動バックアップ。

```
chezmoi/
├── .claude/
│   └── settings.json       # Claude Code 設定 (root側)
├── .vscode/
│   └── extensions.json     # 推奨拡張機能
├── home/                   # ← chezmoi ソースルート
│   ├── .chezmoidata/       # brew/cask/winget パッケージ定義
│   ├── .chezmoiscripts/    # パッケージ導入スクリプト (darwin/windows)
│   ├── .chezmoitemplates/  # mise/starship/opencode 雛形 (OS×role)
│   ├── dot_claude/         # → ~/.claude
│   ├── dot_config/         # → ~/.config
│   ├── AGENTS.md
│   ├── dot_gitconfig.tmpl
│   ├── dot_zshrc
│   ├── private_dot_npmrc
│   └── .chezmoi.toml.tmpl # chezmoi init 時のプロンプト (email/name/role)
├── other_dot_config/       # 管理外: Rectangle, HHKB Studio
├── settingBackup/          # 管理外: yabai, skhd
├── .chezmoiignore          # OS別適用除外
├── .chezmoiroot            # ソースルート (= home)
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md               # エージェント向け運用規約
└── README.md
```

## Mac キーマッピング

### HHKB

| Windows | Mac変更後 | Macデフォルト |
| ------- | --------- | ------------- |
| CTRL    | Command   | Control       |
| Windows | Option    | Command       |
| ALT     | Control   | Option        |

### Mac内蔵キーボード

| デフォルト | 変更後    |
| ---------- | --------- |
| Caps Lock  | Command   |
| Control    | Caps Lock |
| Option     | Option    |
| Command    | Control   |

### Raycast

#### Raycast Hotkey

Command + Space

#### Clipboard History

Option + V

### Alt Tab

Control + Tab

## Claude Code Settings

Claude Codeの設定は以下からコピーして作成を行っている。

[Everything Claude Code](https://github.com/affaan-m/everything-claude-code)

### home\dot_claude\rules\common\coding-style.md

<https://github.com/affaan-m/everything-claude-code/blob/main/docs/ja-JP/rules/coding-style.md>

### home\dot_claude\rules\typescript\coding-style.md

<https://github.com/affaan-m/everything-claude-code/blob/main/rules/typescript/coding-style.md>

### home\dot_claude\skills\coding-standards\SKILL.md

<https://github.com/affaan-m/everything-claude-code/blob/main/docs/ja-JP/skills/coding-standards/SKILL.md>
