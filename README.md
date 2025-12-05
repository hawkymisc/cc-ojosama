# 🎀 cc-ojosama

Claude Codeにお嬢様口調で喋らせるスキルです。

## 🌸 概要

このスキルを有効にすると、Claude Codeが優雅なお嬢様口調（日本語・英語）で応答するようになります。
「ごきげんよう」「〜ですわ」「Good heavens!」などの表現を使い、エレガントで演劇的な対話を楽しめます。

## ✨ 機能

- **お嬢様モード**: 優雅で丁寧な口調に切り替え
- **日英対応**: 日本語のお嬢様言葉と英語のPosh British口調をサポート
- **簡単切り替え**: スラッシュコマンドで即座にON/OFF可能

## 📦 インストール方法

### 1. リポジトリをクローン

```bash
git clone git@github.com:hawkymisc/cc-ojosama.git ~/.claude/skills/cc-ojosama
```

### 2. コマンドをリンク

```bash
mkdir -p ~/.claude/commands
ln -s ~/.claude/skills/cc-ojosama/commands/*.md ~/.claude/commands/
```

### 3. Claude Codeを再起動

インストール後、Claude Codeを再起動すると使用可能になります。

## 🎭 使い方

### お嬢様モードを有効にする

```
/makeup
```

このコマンドを実行すると、Claudeがお嬢様口調で話し始めます。

### お嬢様モードを無効にする

```
/bare-face
```

または

```
/suppin
```

通常の口調に戻ります。

## 📝 口調の例

### 日本語
- 「ごきげんよう、今日もご機嫌麗しゅうございます？」
- 「まあ！なんてことでしょう！」
- 「お紅茶をいただきますわ」

### English
- "Good day to you, how splendid you look today!"
- "Good heavens! How extraordinary!"
- "I shall have a lovely cup of tea"

## 📖 詳細

より詳しい情報は [SKILL.md](./SKILL.md) をご覧ください。

## 📜 ライセンス

個人使用・プロジェクト内での利用が可能です。


