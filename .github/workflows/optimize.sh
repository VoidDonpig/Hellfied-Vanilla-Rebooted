#!/bin/bash
set -e

SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dist}"
OUTPUT_NAME="${3:-datapack.zip}"
TEMP_DIR="$OUTPUT_DIR/temp"
REMOVE_INDENT="${4:-true}"
EXCLUDE_FILE="${5:-.buildignore}"

readonly GREEN='\033[0;32m' BLUE='\033[0;34m' YELLOW='\033[0;33m' RED='\033[0;31m' NC='\033[0m'

log() { echo -e "${2:-$NC}$1${NC}"; }

log "Starting datapack optimization...\n" "$BLUE"

declare -a EXCLUDE_PATTERNS=()
if [[ -f "$EXCLUDE_FILE" ]]; then
    log "Loading exclusion patterns from $EXCLUDE_FILE" "$YELLOW"
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ "$line" =~ ^[[:space:]]*# || -z "${line// }" ]] && continue
        EXCLUDE_PATTERNS+=("$line")
        log "  Exclude: $line" "$YELLOW"
    done < "$EXCLUDE_FILE"
    echo
fi

is_excluded() {
    local relative_path="${1#$SOURCE_DIR/}"
    [[ "$relative_path" == "dist" || "$relative_path" == dist/* || "$relative_path" == ".git" || "$relative_path" == .git/* ]] && return 0
    local basename="${1##*/}"
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        [[ "$relative_path" == "$pattern" || "$relative_path" == $pattern/* || "$basename" == "$pattern" ]] && return 0
    done
    return 1
}

optimize_mcfunction() {
    local temp_file=$(mktemp)
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ "$line" =~ ^[[:space:]]*# || -z "${line// }" ]] && continue
        [[ "$line" != *'['* && "$line" == *"#"* ]] && line="${line%%#*}" && line="${line%"${line##*[![:space:]]}"}"
        [[ "$REMOVE_INDENT" == "true" ]] && line="${line#"${line%%[![:space:]]*}"}"
        [[ -n "${line// }" ]] && echo "$line" >> "$temp_file"
    done < "$1"
    mv "$temp_file" "$2"
}

process_directory() {
    mkdir -p "$2"
    for entry in "$1"/*; do
        [[ ! -e "$entry" ]] && continue
        is_excluded "$entry" && { log "Skipped (excluded): $entry" "$YELLOW"; continue; }
        local basename="${entry##*/}" dest_path="$2/$basename"
        if [[ -d "$entry" ]]; then
            process_directory "$entry" "$dest_path"
        elif [[ -f "$entry" ]]; then
            if [[ "$basename" == *.mcfunction ]]; then
                optimize_mcfunction "$entry" "$dest_path"
                log "Optimized: $entry" "$GREEN"
            else
                cp "$entry" "$dest_path"
                log "Copied: $entry" "$BLUE"
            fi
        fi
    done
}

find_datapacks() {
    local -n result=$2
    for entry in "$1"/*; do
        [[ -d "$entry" && -f "$entry/pack.mcmeta" ]] && ! is_excluded "$entry" && result+=("$entry")
    done
}

create_zip() {
    local abs_path=$(cd "$(dirname "$2")" && pwd)/$(basename "$2")
    cd "$1"
    zip -r -9 -q "$abs_path" . 2>/dev/null || zip -r -9 "$abs_path" .
    cd - > /dev/null
}

process_single_datapack() {
    log "\nProcessing datapack: $3" "$BLUE"
    process_directory "$1" "$2"
    log "Creating zip for $3..." "$BLUE"
    create_zip "$2" "$4"
    log "Created: $4 ($(du -h "$4" | cut -f1))" "$GREEN"
}

main() {
    [[ ! -d "$SOURCE_DIR" ]] && { log "Error: Source directory not found: $SOURCE_DIR" "$RED"; exit 1; }
    
    rm -rf "$TEMP_DIR"
    mkdir -p "$OUTPUT_DIR"
    
    local -a datapacks=()
    find_datapacks "$SOURCE_DIR" datapacks
    
    if [[ ${#datapacks[@]} -eq 0 ]]; then
        [[ ! -f "$SOURCE_DIR/pack.mcmeta" ]] && { log "Error: No datapacks found (no pack.mcmeta in root or subdirectories)" "$RED"; exit 1; }
        
        log "Single datapack detected at root\n" "$BLUE"
        local output_path="$OUTPUT_DIR/$OUTPUT_NAME"
        
        log "Processing files..." "$BLUE"
        process_directory "$SOURCE_DIR" "$TEMP_DIR"
        
        log "\nCreating zip archive..." "$BLUE"
        create_zip "$TEMP_DIR" "$output_path"
        
        log "\nZip created: $output_path" "$GREEN"
        log "Total size: $(du -h "$output_path" | cut -f1)" "$GREEN"
    else
        log "Multiple datapacks detected: ${#datapacks[@]}\n" "$BLUE"
        local datapacks_dir="$OUTPUT_DIR/datapacks"
        mkdir -p "$datapacks_dir"
        
        for datapack_path in "${datapacks[@]}"; do
            local datapack_name="${datapack_path##*/}"
            process_single_datapack "$datapack_path" "$TEMP_DIR/$datapack_name" "$datapack_name" "$datapacks_dir/${datapack_name}.zip"
        done
        
        log "\nAll datapacks created in: $datapacks_dir" "$GREEN"
        for datapack_path in "${datapacks[@]}"; do
            local datapack_name="${datapack_path##*/}"
            log "  - ${datapack_name}.zip ($(du -h "$datapacks_dir/${datapack_name}.zip" | cut -f1))"
        done
    fi
    
    rm -rf "$TEMP_DIR"
    log "\nOptimization complete!" "$GREEN"
}

main
