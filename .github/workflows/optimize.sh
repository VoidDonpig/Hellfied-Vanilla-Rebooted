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
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line//[[:space:]]/}" ]] && continue
        EXCLUDE_PATTERNS+=("$line")
        echo -e "  ${YELLOW}Exclude:${NC} $line"
    done < "$EXCLUDE_FILE"
    echo ""
fi

is_excluded() {
    local path="$1"
    local relative="${path#$SOURCE_DIR/}"
    local base="${path##*/}"

    [[ "$relative" == "dist" || "$relative" == dist/* ]] && return 0
    [[ "$relative" == ".git"  || "$relative" == .git/*  ]] && return 0

    for p in "${EXCLUDE_PATTERNS[@]}"; do
        [[ "$relative" == "$p" || "$relative" == "$p/"* ]] && return 0
        [[ "$base" == "$p" ]] && return 0
    done
    return 1
}

optimize_mcfunction() {
    local input="$1"
    local output="$2"
    local tmp
    tmp="$(mktemp)"

    while IFS= read -r line || [ -n "$line" ]; do
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line//[[:space:]]/}" ]] && continue

        if [[ "$line" != *'['* && "$line" == *'#'* ]]; then
            line="${line%%#*}"
            line="${line%"${line##*[![:space:]]}"}"
        fi

        [[ "$REMOVE_INDENT" == "true" ]] && line="${line#"${line%%[![:space:]]*}"}"
        [[ -n "${line//[[:space:]]/}" ]] && printf '%s\n' "$line" >> "$tmp"
    done < "$input"

    mv "$tmp" "$output"
}

process_directory() {
    local src="$1"
    local dst="$2"

    mkdir -p "$dst"
    shopt -s nullglob

    for e in "$src"/*; do
        is_excluded "$e" && {
            echo -e "${YELLOW}Skipped (excluded):${NC} $e"
            continue
        }

        local name="${e##*/}"
        local out="$dst/$name"

        if [ -d "$e" ]; then
            process_directory "$e" "$out"
        elif [ -f "$e" ]; then
            if [[ "$name" == *.mcfunction ]]; then
                optimize_mcfunction "$e" "$out"
                echo -e "${GREEN}Optimized:${NC} $e"
            else
                cp "$e" "$out"
                echo -e "${BLUE}Copied:${NC} $e"
            fi
        fi
    done
}

find_datapacks() {
    local dir="$1"
    local -n out=$2
    shopt -s nullglob

    for e in "$dir"/*; do
        [ -d "$e" ] && [ -f "$e/pack.mcmeta" ] && ! is_excluded "$e" && out+=("$e")
    done
}

process_single_datapack() {
    local src="$1"
    local tmp="$2"
    local name="$3"
    local zipout="$4"

    echo -e "\n${BLUE}Processing datapack: ${name}${NC}"
    process_directory "$src" "$tmp"

    echo -e "${BLUE}Creating zip for ${name}...${NC}"
    (cd "$tmp" && zip -r -9 "$zipout" . > /dev/null)

    local size
    size=$(du -h "$zipout" | cut -f1)
    echo -e "${GREEN}Created: ${zipout} (${size})${NC}"
}

main() {
    [ ! -d "$SOURCE_DIR" ] && {
        echo -e "${RED}Error: Source directory not found: $SOURCE_DIR${NC}"
        exit 1
    }

    rm -rf "$TEMP_DIR"
    mkdir -p "$OUTPUT_DIR"

    declare -a datapacks=()
    find_datapacks "$SOURCE_DIR" datapacks

    if [ "${#datapacks[@]}" -eq 0 ]; then
        [ ! -f "$SOURCE_DIR/pack.mcmeta" ] && {
            echo -e "${RED}Error: No datapacks found (no pack.mcmeta in root or subdirectories)${NC}"
            exit 1
        }

        echo -e "${BLUE}Single datapack detected at root${NC}\n"
        local out="$OUTPUT_DIR/$OUTPUT_NAME"
        rm -f "$out"

        echo -e "${BLUE}Processing files...${NC}"
        process_directory "$SOURCE_DIR" "$TEMP_DIR"

        echo -e "\n${BLUE}Creating zip archive...${NC}"
        (cd "$TEMP_DIR" && zip -r -9 "../$OUTPUT_NAME" . > /dev/null)

        rm -rf "$TEMP_DIR"

        local size
        size=$(du -h "$out" | cut -f1)
        echo -e "\n${GREEN}Zip created:${NC} $out"
        echo -e "${GREEN}Total size:${NC} $size"
    else
        echo -e "${BLUE}Multiple datapacks detected: ${#datapacks[@]}${NC}\n"

        local outdir="$OUTPUT_DIR/datapacks"
        mkdir -p "$outdir"

        for d in "${datapacks[@]}"; do
            local name="${d##*/}"
            process_single_datapack "$d" "$TEMP_DIR/$name" "$name" "$outdir/$name.zip"
        done

        rm -rf "$TEMP_DIR"

        echo -e "\n${GREEN}All datapacks created in:${NC} $outdir"
        for d in "${datapacks[@]}"; do
            local name="${d##*/}"
            local size
            size=$(du -h "$outdir/$name.zip" | cut -f1)
            echo -e "  - ${name}.zip (${size})"
        done
    fi

    echo -e "\n${GREEN}Optimization complete!${NC}"
}

main
