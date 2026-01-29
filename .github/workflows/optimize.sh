#!/bin/bash

SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dist}"
OUTPUT_NAME="${3:-datapack.zip}"
TEMP_DIR="$OUTPUT_DIR/temp"
REMOVE_INDENT="${4:-true}"
EXCLUDE_FILE="${5:-.buildignore}"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}Starting datapack optimization...${NC}\n"

declare -a EXCLUDE_PATTERNS=()
if [ -f "$EXCLUDE_FILE" ]; then
    echo -e "${YELLOW}Loading exclusion patterns from $EXCLUDE_FILE${NC}"
    while IFS= read -r line || [ -n "$line" ]; do
        if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            EXCLUDE_PATTERNS+=("$line")
            echo -e "  ${YELLOW}Exclude:${NC} $line"
        fi
    done < "$EXCLUDE_FILE"
    echo ""
fi

is_excluded() {
    local path="$1"
    local relative_path="${path#$SOURCE_DIR/}"
    
    if [[ "$relative_path" == "dist" ]] || [[ "$relative_path" == dist/* ]]; then
        return 0
    fi
    
    if [[ "$relative_path" == ".git" ]] || [[ "$relative_path" == .git/* ]]; then
        return 0
    fi
    
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        if [[ "$relative_path" == $pattern ]] || [[ "$relative_path" == $pattern/* ]]; then
            return 0
        fi
        
        local basename=$(basename "$path")
        if [[ "$basename" == $pattern ]]; then
            return 0
        fi
    done
    
    return 1
}

optimize_mcfunction() {
    local input_file="$1"
    local output_file="$2"
    
    local temp_file=$(mktemp)
    
    while IFS= read -r line || [ -n "$line" ]; do
        if [[ "$line" =~ ^[[:space:]]*# ]]; then
            continue
        fi
        
        if [[ -z "$(echo "$line" | tr -d '[:space:]')" ]]; then
            continue
        fi
        
        if [[ "$line" != *'['* ]] && [[ "$line" == *"#"* ]]; then
            line="${line%%#*}"
            line=$(echo "$line" | sed 's/[[:space:]]*$//')
        fi
        
        if [[ "$REMOVE_INDENT" == "true" ]]; then
            line=$(echo "$line" | sed 's/^[[:space:]]*//')
        fi
        
        if [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            echo "$line" >> "$temp_file"
        fi
    done < "$input_file"
    
    mv "$temp_file" "$output_file"
}

process_directory() {
    local src_dir="$1"
    local dest_dir="$2"
    
    mkdir -p "$dest_dir"
    
    for entry in "$src_dir"/*; do
        if [ ! -e "$entry" ]; then
            continue
        fi
        
        if is_excluded "$entry"; then
            echo -e "${YELLOW}Skipped (excluded):${NC} $entry"
            continue
        fi
        
        local basename=$(basename "$entry")
        local dest_path="$dest_dir/$basename"
        
        if [ -d "$entry" ]; then
            process_directory "$entry" "$dest_path"
        elif [ -f "$entry" ]; then
            if [[ "$basename" == *.mcfunction ]]; then
                optimize_mcfunction "$entry" "$dest_path"
                echo -e "${GREEN}Optimized:${NC} $entry"
            else
                cp "$entry" "$dest_path"
                echo -e "${BLUE}Copied:${NC} $entry"
            fi
        fi
    done
}

main() {
    if [ ! -d "$SOURCE_DIR" ]; then
        echo -e "${RED}Error: Source directory not found: $SOURCE_DIR${NC}"
        exit 1
    fi
    
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
    
    local output_path="$OUTPUT_DIR/$OUTPUT_NAME"
    if [ -f "$output_path" ]; then
        rm "$output_path"
    fi
    
    mkdir -p "$OUTPUT_DIR"
    
    echo -e "\n${BLUE}Processing files...${NC}"
    process_directory "$SOURCE_DIR" "$TEMP_DIR"
    
    echo -e "\n${BLUE}Creating zip archive...${NC}"
    cd "$TEMP_DIR"
    zip -r -9 "../$OUTPUT_NAME" . > /dev/null
    cd - > /dev/null
    
    rm -rf "$TEMP_DIR"
    
    local size=$(du -h "$output_path" | cut -f1)
    
    echo -e "\n${GREEN}Zip created:${NC} $output_path"
    echo -e "${GREEN}Total size:${NC} $size"
    echo -e "\n${GREEN}Optimization complete!${NC}"
}

main
