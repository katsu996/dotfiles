#!/bin/bash

set -eu

brew bundle install --file="${HOME}"/dotfiles/.Brewfile

echo "Changing MacOS settings"

echo "■基本形■"
echo "クラッシュレポートの無効化"
defaults write com.apple.CrashReporter DialogType -string "none"

echo "■Finder関連■"
echo "パスバーを表示"
defaults write com.apple.finder ShowPathbar -bool true
echo "ステータスバーを表示"
defaults write com.apple.finder ShowStatusBar -bool true
echo "拡張子を常に表示"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "隠しファイルを表示"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "■メニューバー関連■"
echo "半透明処理を無効化"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
echo "右端の時刻表示、12:34:56"
defaults write com.apple.menuextra.clock DateFormat -string "H:mm:ss"
echo "バッテリーの残量をパーセント表示"
defaults write com.apple.menuextra.battery ShowPercent YES

# echo 'Rebooting to reflect settings'
# sudo shutdown -r now