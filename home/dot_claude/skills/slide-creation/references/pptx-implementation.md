# PowerPoint実装

## 1. 実装の原則

- テキスト・図形・表・グラフ・線・矢印をPowerPointのネイティブ要素で作る
- スライド全面を画像にしない
- 文字入り画像やスクリーンショットを使わない
- 図形の上へ別のテキストボックスを重ねない
- 文字は原則として図形の中に直接入れる
- 枠線や塗りが不要な文章は、塗りなし・線なしの長方形図形へ直接入れる
- タイトル・リード文・見出し・注記・出典も同様に長方形図形を使用する
- 角丸四角形を標準部品にしない
- 箇条書きはPowerPointの段落・箇条書き機能を使う
- 矢羽根はPowerPoint標準の図形（`chevron` / `homePlate`）を使い、文字を図形内へ直接入れる
- 接続線は可能な限り接続元・接続先の図形へ接着する
- 主要要素を意味単位で移動・編集できる構造にする

PPTXを直接生成できない環境では、画像だけを完成品として扱わず、同じ構成をPPTX化できる詳細なスライド設計仕様を提示する。

## 2. キャンバスと共通フレーム

16:9 = **13.333in × 7.5in**（pptxgenjs では `pres.layout = "LAYOUT_WIDE"`）。左右マージン 0.5in。

| 要素 | left | top | width | height | 書式 |
|---|---|---|---|---|---|
| セクションラベル（左上） | 0.50 | 0.26 | 7.00 | 0.24 | 8.5pt Bold `1779BA` 字間+1 |
| デッキ名＋ページ（右上） | 6.00 | 0.26 | 6.83 | 0.24 | 8.5pt `607089` 右揃え |
| ヘッダー区切り線 | 0.50 → 12.83 | 0.60 | — | — | 0.75px `D5DEE7` |
| タイトル | 0.50 | 0.72 | 12.33 | 0.50 | 22pt Bold `12385B` |
| リード文 | 0.50 | 1.27 | 12.33 | 0.52 | 12.5pt `182235` 行間1.34 |
| 本文領域 | 0.50 | 1.96 | 12.33 | 4.76 | （下端 6.72） |
| フッター区切り線 | 0.50 → 12.83 | 6.92 | — | — | 0.75px `D5DEE7` |
| ページ番号（右下） | 10.83 | 7.00 | 2.00 | 0.26 | 8.5pt `607089` 右揃え |

本文領域は左右2列に分ける場合、境界の縦罫線を本文の途中で止め、
左右のブロック開始位置（例：1.96 / 3.10 / 5.10）を共通の水平グリッドに揃えると対応関係が明示できる。

本文量でこの座標を動かさない。収まらないときは本文内の領域配分・文章量・構造・ページ分割を見直す。

## 3. 文字サイズの標準（日本語・高密度）

| 階層 | サイズ | 太さ | 色 |
|---|---|---|---|
| スライドタイトル | 24pt | Bold | `12385B` |
| リード文 | 13pt | Regular（数値のみBold） | `182235` |
| 主要領域の見出し | 12pt | Bold | `12385B` または白（濃紺帯の上） |
| 項目見出し | 10.5pt | Bold | `12385B` |
| 本文・箇条書き | 9.5〜10pt | Regular | `182235` |
| 補助説明・解釈 | 9pt | Regular | `607089` |
| 注記・出典 | 8.5pt | Regular | `607089` |

一般的な英語スライドの「本文14〜16pt」は適用しない。ただし本文を9pt未満に落として詰め込まない。

## 4. pptxgenjs の落とし穴（このデザインで踏みやすいもの）

- **色に `#` を付けない**。`color: "12385B"`。`"#12385B"` や8桁（アルファ入り）は **ファイルを破損させる**。透過は `transparency: 0-100`。
- **`pres.layout` はスライド追加より前に設定する**。既定は 10×5.625in なので、13.333in前提の座標は画面外に消える（クランプされない）。
- **オプションオブジェクトを再利用しない**。pptxgenjs は渡したオブジェクトをEMUに破壊的変換する。`add*` ごとに新しいオブジェクトを作る（グローバル定数の使い回しは `{...BASE}` で複製する）。
- **図形と文字の左端をそろえるときは `margin: 0`**。テキストボックスには既定の内側余白がある。
- **箇条書きは各項目に `bullet: true`**。リテラルの `•` は二重表示になる。最後以外の項目に `breakLine: true`。行間は `lineSpacing` ではなく `paraSpaceAfter` で調整する。
- **`rectRadius` は `ROUNDED_RECTANGLE` のみ有効**（このデザインでは角丸を使わないので不要）。
- **グラデーション塗りは非対応**（このデザインでは使わない）。
- **矢羽根は `shape: pres.ShapeType.homePlate`**（左端が直線・右端が尖る＝標準形）。`chevron` は左端も凹むので、フェーズを連結して見せたい場合のみ。
- **グラフはネイティブ `addChart()` で作る**。既定は装飾が古いので `chartColors` に上のパレット、`valGridLine: { color: "D5DEE7", size: 0.5 }`、`catGridLine: { style: "none" }`、`catAxisLabelColor`/`valAxisLabelColor: "607089"`、単系列なら `showLegend: false` を指定する。
- **積み上げグラフの `dataLabelPosition` は `ctr` / `inEnd` / `inBase` のみ**。`outEnd` は破損させる。
- **1出力ファイルにつき `new pptxgen()` は1つ**。

## 5. フォントとQAの注意（重要）

**Noto Sans JP は LibreOffice のQAレンダリングで代替フォントに置き換わることがあり、文字幅が変わる**（macOS の対処は 6章の手順0）。

- 代替フォントで描画された場合、ビジュアルQAで見える「はみ出し／収まり」は近似値にすぎない。
- そのため **テキストボックスの幅・高さに約10%の余裕** を持たせる。
- 実際のPowerPointで開いたときに崩れないことを最終確認する（可能な場合）。
- 出力先環境に Noto Sans JP が無い可能性がある場合のみ、ユーザーに代替（Yu Gothic / Meiryo）を確認する。フォント名は勝手に変えない。

## 6. QA手順

`pptx` スキル（document-skills:pptx）の技術部分を使う。スクリプトの実パスはそのスキルを読み込んで取得する。

**macOS では `--headless` で起動した LibreOffice がシステム／ユーザーフォントを読まず、同梱フォントだけで描画する**（日本語が空白・豆腐になる）。`soffice.py` は毎回空の一時プロファイルを作るため、そのままでは必ず再現する。プロファイルの `user/fonts` に置いたフォントは読まれるので、フォントを入れた固定プロファイルを `-env:UserInstallation` で渡す。

```bash
# 0. QA用プロファイル（初回のみ。macOS）
LO_PROFILE="$HOME/.cache/slide-creation/lo-profile"
mkdir -p "$LO_PROFILE/user/fonts"
cp "$HOME/Library/Fonts/NotoSansJP[wght].ttf" "$LO_PROFILE/user/fonts/"

# 1. 構造検証（必須。defusedxml が無ければ venv に入れて実行）
python <pptx-skill>/scripts/office/validate.py output.pptx

# 2. 内容確認
markitdown output.pptx

# 3. ビジュアルQA（PDFに NotoSansJP が埋め込まれたことを pdffonts で確認する）
python <pptx-skill>/scripts/office/soffice.py -env:UserInstallation="file://$LO_PROFILE" --headless --convert-to pdf output.pptx
pdffonts output.pdf | grep -q NotoSansJP || echo "Noto Sans JP 未使用: 描画結果は信用しない"
find . -maxdepth 1 -name 'slide-*.jpg' -delete   # zsh では一致なしの rm glob がエラーになり後続が止まる
pdftoppm -jpeg -r 150 output.pdf slide
ls -1 "$PWD"/slide-*.jpg   # 出た絶対パスを画像として実際に見る
```

修正後は PDF から再生成する（.pptx を直しただけでは画像は変わらない）。

見るべき欠陥: 文字のはみ出し・切れ（最頻・最優先） / 要素の重なり / 出典やフッターと本文の衝突 / 0.3in未満の隙間 / 余白の偏り / スライド端0.5in未満 / 列の不整列 / 低コントラスト / 不自然な改行。
