---
name: pr-review-fetch
description: >-
  指定されたPR番号のレビューコメントを全件取得し、未解決コメントの妥当性評価・コード修正・返信メッセージ案の作成まで行う。
  引数がPR番号の場合はコメント取得から、MDファイルパスの場合は妥当性評価から開始する。
---

# PR Review Comments Fetcher & Responder

## Usage

引数として **PR 番号** または **既存の取得済み MD ファイルパス** を受け取る。

- **PR 番号**（数字のみ）: Phase A（コメント取得）→ Phase B（妥当性評価）の順に実行
- **MD ファイルパス**（`.md` で終わる文字列）: Phase B（妥当性評価）から開始

## Phase A: レビューコメント取得（PR 番号の場合のみ）

引数が MD ファイルパスの場合はこの Phase をスキップし、Phase B へ進む。

### A-1. リポジトリ情報取得 & レビューコメント一括取得

カレントリポジトリの owner/name を自動取得し、GraphQL 変数として渡す。
`PR_NUMBER` を引数の数字に置換して実行する。

```bash
REMOTE_URL=$(git remote get-url origin)
REPO_PATH=$(echo "$REMOTE_URL" | sed -E 's#^https?://[^/]+/##; s#^[^:]+:##; s/\.git$//')
OWNER=$(echo "$REPO_PATH" | cut -d/ -f1)
NAME=$(echo "$REPO_PATH" | cut -d/ -f2)

gh api graphql \
  -f owner="$OWNER" \
  -f name="$NAME" \
  -F number=PR_NUMBER \
  -f query='
query($owner: String!, $name: String!, $number: Int!) {
  viewer {
    login
  }
  repository(owner: $owner, name: $name) {
    pullRequest(number: $number) {
      title
      body
      url
      state
      headRefName
      baseRefName
      reviews(first: 100) {
        nodes {
          author { login }
          state
          body
          submittedAt
        }
      }
      reviewThreads(first: 100) {
        nodes {
          isResolved
          comments(first: 50) {
            nodes {
              databaseId
              body
              author { login }
              path
              line
              createdAt
              replyTo { databaseId }
            }
          }
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
    }
  }
}'
```

### A-2. ページネーション

`reviewThreads.pageInfo.hasNextPage` が `true` の場合、
`endCursor` を使って `after` パラメータ付きで追加取得する。

```bash
gh api graphql \
  -f owner="$OWNER" \
  -f name="$NAME" \
  -F number=PR_NUMBER \
  -f after="END_CURSOR" \
  -f query='
query($owner: String!, $name: String!, $number: Int!, $after: String!) {
  repository(owner: $owner, name: $name) {
    pullRequest(number: $number) {
      reviewThreads(first: 100, after: $after) {
        nodes {
          isResolved
          comments(first: 50) {
            nodes {
              databaseId
              body
              author { login }
              path
              line
              createdAt
              replyTo { databaseId }
            }
          }
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
    }
  }
}'
```

### A-3. 結果を MD ファイルに出力

取得したデータを整理し、MD ファイルとして保存する。

#### 出力先

```
.katsuTemp/pr/{PR_NUMBER}/pr{PR_NUMBER}_{YYYYMMDDHHmm}_{連番}_{PR名}.md
```

- ディレクトリが存在しない場合は作成する
- 連番はディレクトリ内の既存 `.md` ファイル数 + 1（2桁ゼロ埋め）
- PR名はファイル名に使える形式にする（スペース・特殊文字はハイフンに置換、50文字以内）

#### MD ファイルの構成

```markdown
# PR #{PR_NUMBER}: {title}

- **State**: {state}
- **Branch**: {headRefName} → {baseRefName}
- **URL**: {url}

## レビュー状態

| レビュアー | 状態 | 日時 |
|-----------|------|------|
| {author}  | {state} | {submittedAt} |

## 未解決スレッド — 未返信（自分の対応待ち）({N}件)

スレッド内の最後のコメント投稿者が自分（viewer.login）以外のスレッド。

### {path}:{line}
**{author}** ({createdAt})
> {body}

## 未解決スレッド — 返信済み（相手の対応待ち）({N}件)

スレッド内の最後のコメント投稿者が自分（viewer.login）のスレッド。

### {path}:{line}
**{author}** ({createdAt})
> {body}

## 解決済みスレッド ({M}件)

<details>
<summary>{path}:{line} - {最初のコメントの冒頭30文字}...</summary>

**{author}** ({createdAt})
> {body}

**{reply_author}** ({reply_createdAt})
> {reply_body}

</details>
```

Phase A が完了したら、出力した MD ファイルのパスを保持して Phase B に進む。

---

## Phase B: 妥当性評価

Phase A で出力した MD ファイル、または引数で渡された MD ファイルを読み込み、
**未解決スレッド（「未返信」と「返信済み」の両方）** について妥当性を評価する。

### B-1. 対象コメントの特定とソースコード確認

MD ファイルの「未解決スレッド」セクションから各コメントを抽出し、
コメントが指しているソースコードファイルの該当箇所を Read ツールで読み込む。
コメント前後の十分なコンテキスト（前後 20 行程度）を確認する。

### B-2. 各コメントの妥当性評価

各コメントについて以下を判断する:

- **妥当性**: コメントの指摘が正しいか（妥当 / 一部妥当 / 議論が必要 / 対応不要）
- **修正の要否**: コード修正が必要か（要修正 / 修正不要 / 議論後判断）
- **評価理由**: 判断の根拠を簡潔に記載

評価の際は、プロジェクトの CLAUDE.md / AGENTS.md のコーディング規約・アーキテクチャパターンに照らして判断する。

### B-3. 評価結果を MD ファイルに出力

#### 出力先

Phase A を実行した場合:
```
.katsuTemp/pr/{PR_NUMBER}/pr{PR_NUMBER}_{YYYYMMDDHHmm}_{連番}_review.md
```

引数が MD ファイルパスの場合:
- ファイルパスから PR 番号を抽出して同じディレクトリに保存
- 例: `.katsuTemp/pr/1600/pr1600_{YYYYMMDDHHmm}_{連番}_review.md`

#### MD ファイルの構成

```markdown
# PR #{PR_NUMBER} レビュー対応表

- **元ファイル**: {Phase A の MD ファイルパス or 引数のファイルパス}
- **評価日時**: {YYYY-MM-DD HH:mm}

## 未解決コメント一覧

| No | ID | レビュアー | ファイル | コメント概要 | 妥当性 | 修正要否 |
|----|-----|-----------|---------|-------------|--------|---------|
| 1  | {databaseId} | {author} | {path}:{line} | {コメント冒頭40文字} | 妥当 | 要修正 |
| 2  | {databaseId} | {author} | {path}:{line} | {コメント冒頭40文字} | 対応不要 | 修正不要 |

## 各コメントの詳細評価

### No.1 — {path}:{line}
- **レビュアー**: {author}
- **コメント ID**: {databaseId}
- **コメント内容**:
  > {body}
- **妥当性**: 妥当
- **修正要否**: 要修正
- **評価理由**: {判断の根拠}
- **対応方針**: {どう修正するか、または議論ポイント}
```

### B-4. ユーザーへの確認

評価結果の MD ファイルを出力したら、ユーザーに以下を確認する:

1. 評価結果のサマリーを表示する
2. 修正が必要なコメントの No 一覧を提示する
3. **「修正対象の No を指定してください（例: 1,3）。全件修正する場合は `all` と入力してください。」** と案内する

---

## Phase C: コード修正と返信メッセージ作成

ユーザーから修正対象の No（または `all`）が指定されたら実行する。

### C-1. コード修正

指定された No のコメントについて:

1. 該当ファイルを読み込む
2. レビューコメントの指摘に従ってコードを修正する
3. 修正不要と評価したコメントはスキップする

### C-2. コミットメッセージと返信メッセージの出力

コミットは行わず、以下を出力する:

#### コミットメッセージ案

```
fix: PR #{PR_NUMBER} レビュー指摘対応

- No.X: {対応内容の要約}
- No.Y: {対応内容の要約}
```

#### 各コメントへの返信メッセージ案

No ごとに以下を出力する:

```markdown
### No.X — {path}:{line} への返信
**宛先**: @{reviewer}

{返信メッセージ本文}
```

返信メッセージは以下のガイドラインに従う:
- 修正した場合: 修正内容を簡潔に説明する
- 修正不要と判断した場合: 理由を丁寧に説明する
- 議論が必要な場合: 論点を整理し、自分の見解を述べた上で相手の意見を求める
