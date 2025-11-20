#!/bin/bash

# Skills.md (SKILL.md) の内容を他のMarkdownファイルに追記するスクリプト

# カラー定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 使い方を表示する関数
show_usage() {
    echo -e "${CYAN}使い方:${NC}"
    echo "  $0 [ファイル名1] [ファイル名2] ..."
    echo ""
    echo -e "${CYAN}説明:${NC}"
    echo "  SKILL.md の内容（YAMLフロントマターを除く）を指定したファイルに追記します。"
    echo ""
    echo -e "${CYAN}例:${NC}"
    echo "  $0                      # デフォルト: AGENTS.md と GEMINI.md に追記"
    echo "  $0 AGENTS.md            # AGENTS.md のみに追記"
    echo "  $0 AGENTS.md GEMINI.md  # AGENTS.md と GEMINI.md に追記"
    echo "  $0 CUSTOM.md            # CUSTOM.md に追記"
    echo ""
}

# ヘルプオプションのチェック
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_usage
    exit 0
fi

# ソースファイル
SOURCE_FILE="SKILL.md"

# 追記先ファイルのリスト（CLI引数から取得、なければデフォルト）
if [ $# -gt 0 ]; then
    TARGET_FILES=("$@")
else
    TARGET_FILES=("AGENTS.md" "GEMINI.md")
fi

# ソースファイルの存在確認
if [ ! -f "$SOURCE_FILE" ]; then
    echo -e "${RED}エラー: $SOURCE_FILE が見つかりません${NC}"
    exit 1
fi

echo -e "${GREEN}$SOURCE_FILE の内容を追記します（YAMLフロントマターは除外）...${NC}"
echo ""

# YAMLフロントマターを除外して内容を抽出する関数
extract_content_without_frontmatter() {
    # 2つ目の --- の後から内容を抽出
    awk '/^---$/ {count++; next} count >= 2 {print}' "$SOURCE_FILE"
}

# 各ターゲットファイルに追記
for target in "${TARGET_FILES[@]}"; do
    echo -e "${YELLOW}処理中: $target${NC}"

    if [ -f "$target" ]; then
        # ファイルが存在する場合は追記
        echo "" >> "$target"
        echo "---" >> "$target"
        echo "" >> "$target"
        echo "# Appended from $SOURCE_FILE" >> "$target"
        echo "" >> "$target"
        extract_content_without_frontmatter >> "$target"
        echo -e "${GREEN}✓ $target に追記しました${NC}"
    else
        # ファイルが存在しない場合は新規作成
        echo "# Created from $SOURCE_FILE" > "$target"
        echo "" >> "$target"
        extract_content_without_frontmatter >> "$target"
        echo -e "${GREEN}✓ $target を新規作成しました${NC}"
    fi
    echo ""
done

echo -e "${GREEN}すべての処理が完了しました！${NC}"
