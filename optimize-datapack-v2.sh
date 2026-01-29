#!/bin/bash

# 設定
SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dist}"
OUTPUT_NAME="${3:-datapack.zip}"
TEMP_DIR="$OUTPUT_DIR/temp"
REMOVE_INDENT="${4:-true}"  # インデントを削除するかどうか（デフォルト: true）
EXCLUDE_FILE="${5:-.buildignore}"  # 除外設定ファイル

# 色付き出力
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting datapack optimization...${NC}\n"

# 除外パターンを読み込む
declare -a EXCLUDE_PATTERNS=()
if [ -f "$EXCLUDE_FILE" ]; then
    echo -e "${YELLOW}Loading exclusion patterns from $EXCLUDE_FILE${NC}"
    while IFS= read -r line || [ -n "$line" ]; do
        # コメント行と空行をスキップ
        if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            EXCLUDE_PATTERNS+=("$line")
            echo -e "  ${YELLOW}Exclude:${NC} $line"
        fi
    done < "$EXCLUDE_FILE"
    echo ""
fi

# ファイル/ディレクトリが除外対象かチェック
is_excluded() {
    local path="$1"
    local relative_path="${path#$SOURCE_DIR/}"
    
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        # パターンマッチング
        if [[ "$relative_path" == $pattern ]] || [[ "$relative_path" == $pattern/* ]]; then
            return 0  # 除外対象
        fi
        
        # ファイル名のみでマッチング
        local basename=$(basename "$path")
        if [[ "$basename" == $pattern ]]; then
            return 0
        fi
    done
    
    return 1  # 除外対象外
}

# .mcfunction ファイルを最適化する関数
optimize_mcfunction() {
    local input_file="$1"
    local output_file="$2"
    
    # 一時ファイル
    local temp_file=$(mktemp)
    
    # コメント行と空行を削除
    while IFS= read -r line || [ -n "$line" ]; do
        # コメント行をスキップ
        if [[ "$line" =~ ^[[:space:]]*# ]]; then
            continue
        fi
        
        # 空行をスキップ
        if [[ -z "$(echo "$line" | tr -d '[:space:]')" ]]; then
            continue
        fi
        
        # 行末コメントを削除（# の前まで）
        # ただし、JSON内の#は除外するため、簡易的な処理
        if [[ "$line" != *'['* ]] && [[ "$line" == *"#"* ]]; then
            line="${line%%#*}"
            # 末尾の空白を削除
            line=$(echo "$line" | sed 's/[[:space:]]*$//')
        fi
        
        # インデントを削除（オプション）
        if [[ "$REMOVE_INDENT" == "true" ]]; then
            line=$(echo "$line" | sed 's/^[[:space:]]*//')
        fi
        
        # 内容がある場合のみ出力
        if [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            echo "$line" >> "$temp_file"
        fi
    done < "$input_file"
    
    # 出力ファイルに移動
    mv "$temp_file" "$output_file"
}

# ディレクトリを再帰的にコピー＆最適化
process_directory() {
    local src_dir="$1"
    local dest_dir="$2"
    
    # 出力ディレクトリを作成
    mkdir -p "$dest_dir"
    
    # ディレクトリ内のファイルとディレクトリを処理
    for entry in "$src_dir"/*; do
        if [ ! -e "$entry" ]; then
            continue
        fi
        
        # 除外チェック
        if is_excluded "$entry"; then
            echo -e "${YELLOW}Skipped (excluded):${NC} $entry"
            continue
        fi
        
        local basename=$(basename "$entry")
        local dest_path="$dest_dir/$basename"
        
        if [ -d "$entry" ]; then
            # ディレクトリの場合は再帰的に処理
            process_directory "$entry" "$dest_path"
        elif [ -f "$entry" ]; then
            if [[ "$basename" == *.mcfunction ]]; then
                # .mcfunction ファイルを最適化
                optimize_mcfunction "$entry" "$dest_path"
                echo -e "${GREEN}Optimized:${NC} $entry"
            else
                # その他のファイルはそのままコピー
                cp "$entry" "$dest_path"
                echo -e "${BLUE}Copied:${NC} $entry"
            fi
        fi
    done
}

# メイン処理
main() {
    # ソースディレクトリの存在確認
    if [ ! -d "$SOURCE_DIR" ]; then
        echo -e "${RED}Error: Source directory not found: $SOURCE_DIR${NC}"
        exit 1
    fi
    
    # 一時ディレクトリを削除（存在する場合）
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
    
    # 既存のZipファイルを削除
    local output_path="$OUTPUT_DIR/$OUTPUT_NAME"
    if [ -f "$output_path" ]; then
        rm "$output_path"
    fi
    
    # 出力ディレクトリを作成
    mkdir -p "$OUTPUT_DIR"
    
    # ファイルを処理
    echo -e "\n${BLUE}Processing files...${NC}"
    process_directory "$SOURCE_DIR" "$TEMP_DIR"
    
    # Zipファイルを作成
    echo -e "\n${BLUE}Creating zip archive...${NC}"
    cd "$TEMP_DIR"
    zip -r -9 "../$OUTPUT_NAME" . > /dev/null
    cd - > /dev/null
    
    # 一時ディレクトリを削除
    rm -rf "$TEMP_DIR"
    
    # ファイルサイズを取得
    local size=$(du -h "$output_path" | cut -f1)
    
    echo -e "\n${GREEN}Zip created:${NC} $output_path"
    echo -e "${GREEN}Total size:${NC} $size"
    echo -e "\n${GREEN}Optimization complete!${NC}"
}

main
