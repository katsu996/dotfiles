# dotfiles

- macOS (Homebrew) とWindows (WinGet) の両方に対応
- common（共通）、work（仕事用）、personal（個人用）の3つのカテゴリでパッケージを管理

## 初期セットアップ

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

ドットファイルを初期化し適用する。
以下のコマンドを実行し、プロンプトが表示されたら**workまたはpersonal**と入力する。

```Bash
chezmoi init --apply katsu996/dotfiles.git
```

プロンプトが表示されずinitされてしまった場合は、手動で`~/.config/chezmoi/chezmoi.toml`ファイルを作成して以下を入力する。

```toml
[data]
    email = "firstname.lastname@example.com"
    name = "firstname.lastname"
    role = "work or personal"
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

| 項目            | Windows                          | Mac                     |
|-----------------|----------------------------------|-------------------------|
| シェル            | clink                            | zsh                     |
| ターミナル         | Windows Terminal<br>Ghostty(予定) | Ghostty                 |
| エディタ           | VSCode                           | VSCode<br>cursor<br>zed |
| ウィンドウマネージャー | -                                | Rectangle + AltTab       |
| プロンプト         | Starship                         | Starship                 |
| パッケージマネージャー | WinGet<br>UnigetUI              | Homebrew                 |
| バージョンマネージャー | Volta → mise                    | mise                     |
| ブラウザ           | Chrome                          | Chrome                   |
| 開発ツール        | Notion<br>Obsidian               | Notion                  |
| ランチャー         | Raycast(予定)                    | Raycast                  |
| Docker          | Docker Desktop                   | OrbStack                |
| DBツール          | A5:SQL Mk-2                      | Sequel Ace              |

## Mac キーマッピング

### HHKB

| Windows | Mac変更後 | Macデフォルト |
|------|------|------|
| CTRL | Command | Control |
| Windows| Option | Command |
| ALT| Control | Option |

### Mac内蔵キーボード

| デフォルト| 変更後 |
|------|------|
| Caps Lock |Command |
| Control | Caps Lock |
| Option | Option |
| Command | Control |

### Raycast

#### Raycast Hotkey

Command + Space

#### Clipboard History

Option + V

### Alt Tab

Control + Tab
