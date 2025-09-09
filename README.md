# dotfiles

- macOS (Homebrew) とWindows (winget) の両方に対応
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

### chezmoiの日常的な使用

環境を最新の状態に保つために、定期的に以下のコマンドを実行する。

変更の確認: `chezmoi diff` コマンドで、リポジトリと現在の環境の差異を確認できる。

最新状態への更新: `chezmoi update` コマンドで、リポジトリの最新の変更をプルし、ホームディレクトリに適用する。

## 開発環境

| 項目            | Windows                          | Mac                     |
|-----------------|----------------------------------|-------------------------|
| シェル            | clink                            | zsh                     |
| ターミナル         | Windows Terminal<br>Ghostty(予定) | Ghostty                 |
| エディタ           | VSCode                           | VSCode<br>cursor<br>zed  |
| ウィンドウマネージャー | -                                | yabai + skhd             |
| プロンプト         | Starship                         | Starship                 |
| パッケージマネージャー | WinGet<br>UnigetUI              | Homebrew                 |
| バージョンマネージャー | Volta → mise                    | mise                     |
| ブラウザ           | Chrome                          | Chrome                   |
| 開発ツール        | Notion<br>Obsidian               | Notion                  |
| ランチャー         | Raycast(予定)                    | Raycast                  |
| Docker          | Docker Desktop                   | OrbStack                 |
