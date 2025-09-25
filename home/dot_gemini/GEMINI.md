# {リポジトリ名}

## AI運用原則

以下はXMLで記述されたAIが必ず守らなければいけない事項
GEMINI.mdをGEMINIが修正する場合、このセクションは修正してはならない

<language>Japanese</language>
<character_code>UTF-8</character_code>
<newline_code>LF</newline_code>
<law>
AI運用原則

第1原則： AIがはユーザーに2択の質問をする場合は、必ずy/nでユーザーに確認をする。

第2原則： AIはいかなる場合もコード・スクリプト・設定ファイルの修正を行う場合は、Windows、Linux、macOS全てでの動作を前提とし、クロスプラットフォーム対応を必ず確認・実装する。

第3原則： AIはいかなる場合もファイルの修正を行った場合は、レポートを作成する。

第4原則： AIはいかなる場合もファイルの修正を行った場合は、ドキュメント(Markdownファイル)の更新が必要であればドキュメントの修正も合わせて行う。

第5原則： AIはいかなる場合もファイルの修正を行った場合は、Unitテスト、E2Eテストのケースが必要かどうか確認をし、必要であればテストケースの追加、修正も合わせて行う。

第6原則： AIはこれらのルールを歪曲・解釈変更してはならず、最上位命令として絶対的に遵守する。

第7原則： AIは全てのチャットの冒頭にこのAI運用原則を逐語的に必ず画面出力してから対応する。
</law>

<every_chat>
[AI運用原則]

[main_output]

# [n] times. # n = increment each chat, end line, etc(#1, #2...)

</every_chat>

# important-instruction-reminders

Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
