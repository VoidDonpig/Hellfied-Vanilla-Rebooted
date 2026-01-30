#!/bin/bash
set -e

SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dist}"
OUTPUT_NAME="${3:-datapack.zip}"
TEMP_DIR="$OUTPUT_DIR/temp"
REMOVE_INDENT="${4:-true}"
EXCLUDE_FILE="${5:-.buildignore}"

readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[0;33m'
readonly RED='\033[0;31m'
readonly NC='\033[0m'

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
    
    if [[ "$relative_path" == "dist" || "$relative_path" == dist/* ]]; then
        return 0
    fi
    
    if [[ "$relative_path" == ".git" || "$relative_path" == .git/* ]]; then
        return 0
    fi
    
    local basename="${1##*/}"
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        if [[ "$relative_path" == "$pattern" || "$relative_path" == $pattern/* || "$basename" == "$pattern" ]]; then
            return 0
        fi
    done
    return 1
}

optimize_mcfunction() {
    local temp_file
    temp_file=$(mktemp)
    
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ "$line" =~ ^[[:space:]]*# || -z "${line// }" ]] && continue
        
        if [[ "$line" != *'['* && "$line" == *"#"* ]]; then
            line="${line%%#*}"
            line="${line%"${line##*[![:space:]]}"}"
        fi
        
        if [[ "$REMOVE_INDENT" == "true" ]]; then
            line="${line#"${line%%[![:space:]]*}"}"
        fi
        
        [[ -n "${line// }" ]] && echo "$line" >> "$temp_file"
    done < "$1"
    
    mv "$temp_file" "$2"
}

process_directory() {
    mkdir -p "$2"
    
    for entry in "$1"/*; do
        [[ ! -e "$entry" ]] && continue
        
        if is_excluded "$entry"; then
            log "Skipped (excluded): $entry" "$YELLOW"
            continue
        fi
        
        local basename="${entry##*/}"
        local dest_path="$2/$basename"
        
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
        if [[ -d "$entry" && -f "$entry/pack.mcmeta" ]]; then
            if ! is_excluded "$entry"; then
                result+=("$entry")
            fi
        fi
    done
}

create_zip() {
    local source_dir="$1"
    local output_file="$2"
    local abs_path
    abs_path=$(cd "$(dirname "$output_file")" && pwd)/$(basename "$output_file")
    
    cd "$source_dir"
    zip -r -9 -q "$abs_path" . 2>/dev/null || zip -r -9 "$abs_path" .
    cd - > /dev/null
}

process_single_datapack() {
    local datapack_dir="$1"
    local temp_datapack_dir="$2"
    local datapack_name="$3"
    local output_path="$4"
    
    log "\nProcessing datapack: $datapack_name" "$BLUE"
    process_directory "$datapack_dir" "$temp_datapack_dir"
    
    log "Creating zip for $datapack_name..." "$BLUE"
    create_zip "$temp_datapack_dir" "$output_path"
    
    local size
    size=$(du -h "$output_path" | cut -f1)
    log "Created: $output_path ($size)" "$GREEN"
}

main() {
    if [[ ! -d "$SOURCE_DIR" ]]; then
        log "Error: Source directory not found: $SOURCE_DIR" "$RED"
        exit 1
    fi
    
    rm -rf "$TEMP_DIR"
    mkdir -p "$OUTPUT_DIR"
    
    local -a datapacks=()
    find_datapacks "$SOURCE_DIR" datapacks
    
    if [[ ${#datapacks[@]} -eq 0 ]]; then
        if [[ ! -f "$SOURCE_DIR/pack.mcmeta" ]]; then
            log "Error: No datapacks found (no pack.mcmeta in root or subdirectories)" "$RED"
            exit 1
        fi
        
        log "Single datapack detected at root\n" "$BLUE"
        local output_path="$OUTPUT_DIR/$OUTPUT_NAME"
        
        log "Processing files..." "$BLUE"
        process_directory "$SOURCE_DIR" "$TEMP_DIR"
        
        log "\nCreating zip archive..." "$BLUE"
        create_zip "$TEMP_DIR" "$output_path"
        
        local size
        size=$(du -h "$output_path" | cut -f1)
        log "\nZip created: $output_path" "$GREEN"
        log "Total size: $size" "$GREEN"
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
            local size
            size=$(du -h "$datapacks_dir/${datapack_name}.zip" | cut -f1)
            log "  - ${datapack_name}.zip ($size)"
        done
    fi
    
    rm -rf "$TEMP_DIR"
    log "\nOptimization complete!" "$GREEN"
}

main
