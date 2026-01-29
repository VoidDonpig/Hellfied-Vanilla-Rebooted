#!/bin/bash

SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dist}"
OUTPUT_NAME="${3:-datapack.zip}"
TEMP_DIR="$OUTPUT_DIR/temp"
REMOVE_INDENT="${4:-true}"
EXCLUDE_FILE="${5:-.buildignore}"

declare -a EXCLUDE_PATTERNS=()
if [ -f "$EXCLUDE_FILE" ]; then
    while IFS= read -r line || [ -n "$line" ]; do
        [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$(echo "$line" | tr -d '[:space:]')" ]] && EXCLUDE_PATTERNS+=("$line")
    done < "$EXCLUDE_FILE"
fi

is_excluded() {
    local path="$1"
    local relative_path="${path#$SOURCE_DIR/}"
    
    [[ "$relative_path" == "dist" || "$relative_path" == dist/* ]] && return 0
    [[ "$relative_path" == ".git" || "$relative_path" == .git/* ]] && return 0
    
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        [[ "$relative_path" == $pattern || "$relative_path" == $pattern/* ]] && return 0
        [[ "$(basename "$path")" == $pattern ]] && return 0
    done
    
    return 1
}

optimize_mcfunction() {
    local input_file="$1"
    local output_file="$2"
    local temp_file=$(mktemp)
    
    while IFS= read -r line || [ -n "$line" ]; do
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "$(echo "$line" | tr -d '[:space:]')" ]] && continue
        
        if [[ "$line" != *'['* && "$line" == *"#"* ]]; then
            line="${line%%#*}"
            line=$(echo "$line" | sed 's/[[:space:]]*$//')
        fi
        
        [[ "$REMOVE_INDENT" == "true" ]] && line=$(echo "$line" | sed 's/^[[:space:]]*//')
        [[ -n "$(echo "$line" | tr -d '[:space:]')" ]] && echo "$line" >> "$temp_file"
    done < "$input_file"
    
    mv "$temp_file" "$output_file"
}

process_directory() {
    local src_dir="$1"
    local dest_dir="$2"
    mkdir -p "$dest_dir"
    
    for entry in "$src_dir"/*; do
        [ ! -e "$entry" ] && continue
        is_excluded "$entry" && continue
        
        local basename=$(basename "$entry")
        local dest_path="$dest_dir/$basename"
        
        if [ -d "$entry" ]; then
            process_directory "$entry" "$dest_path"
        elif [ -f "$entry" ]; then
            [[ "$basename" == *.mcfunction ]] && optimize_mcfunction "$entry" "$dest_path" || cp "$entry" "$dest_path"
        fi
    done
}

[ ! -d "$SOURCE_DIR" ] && echo "Error: Source directory not found: $SOURCE_DIR" && exit 1
[ -d "$TEMP_DIR" ] && rm -rf "$TEMP_DIR"

mkdir -p "$OUTPUT_DIR"

if [ ! -f "$SOURCE_DIR/pack.mcmeta" ]; then
    echo "Error: No pack.mcmeta found in root"
    exit 1
fi

process_directory "$SOURCE_DIR" "$TEMP_DIR"

cd "$TEMP_DIR"
zip -r -9 "$OUTPUT_DIR/$OUTPUT_NAME" . > /dev/null
cd - > /dev/null

rm -rf "$TEMP_DIR"

echo "Complete: $OUTPUT_DIR/$OUTPUT_NAME ($(du -h "$OUTPUT_DIR/$OUTPUT_NAME" | cut -f1))"
