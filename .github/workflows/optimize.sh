#!/usr/bin/env bash
set -euo pipefail

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

echo -e "${BLUE}== Datapack build start ==${NC}"

rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"
mkdir -p "$OUTPUT_DIR"

# -----------------------------
# 除外設定
# -----------------------------
EXCLUDES=()
if [[ -f "$EXCLUDE_FILE" ]]; then
  while IFS= read -r line; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    EXCLUDES+=(--exclude="$line")
  done < "$EXCLUDE_FILE"
fi

# -----------------------------
# datapack 検出
# -----------------------------
mapfile -t PACKS < <(find "$SOURCE_DIR" -maxdepth 1 -type d ! -name ".*" ! -path "$SOURCE_DIR")

if [[ ${#PACKS[@]} -eq 1 ]]; then
  # -----------------------------
  # シングル datapack
  # -----------------------------
  PACK_NAME="$(basename "${PACKS[0]}")"

  echo -e "${GREEN}Single datapack detected:${NC} $PACK_NAME"

  rsync -a "${EXCLUDES[@]}" "${PACKS[0]}/" "$TEMP_DIR/$PACK_NAME/"

  (
    cd "$TEMP_DIR"
    zip -r "$PACK_NAME.zip" "$PACK_NAME" > /dev/null
  )

  # 設計思想どおり dist 直下に本体を置く
  mv "$TEMP_DIR/$PACK_NAME.zip" "$OUTPUT_DIR/$PACK_NAME.zip"

else
  # -----------------------------
  # 複数 datapack
  # -----------------------------
  echo -e "${GREEN}Multiple datapacks detected${NC}"

  for pack in "${PACKS[@]}"; do
    name="$(basename "$pack")"
    rsync -a "${EXCLUDES[@]}" "$pack/" "$TEMP_DIR/$name/"
  done

  (
    cd "$TEMP_DIR"
    zip -r "$OUTPUT_NAME" . > /dev/null
  )

  mv "$TEMP_DIR/$OUTPUT_NAME" "$OUTPUT_DIR/$OUTPUT_NAME"
fi

rm -rf "$TEMP_DIR"

echo -e "${GREEN}== Build completed ==${NC}"
