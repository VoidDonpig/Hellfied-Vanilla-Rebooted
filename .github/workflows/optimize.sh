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

# Load exclusion patterns
declare -a EXCLUDE_PATTERNS=()
if [ -f "$EXCLUDE_FILE" ]; then
    echo -e "${YELLOW}Loading exclusion patterns from $EXCLUDE_FILE${NC}"
    while IFS= read -r line || [ -n "$line" ]; do
        # Skip comments and empty lines
        if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            # Trim whitespace
            line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
            EXCLUDE_PATTERNS+=("$line")
            echo -e "  ${YELLOW}Exclude:${NC} $line"
        fi
    done < "$EXCLUDE_FILE"
    echo ""
fi

# Default exclusions (always excluded)
EXCLUDE_PATTERNS+=(".git" ".github" "node_modules" ".DS_Store" "Thumbs.db")

is_excluded() {
    local path="$1"
    # Convert to absolute path for consistent comparison
    local abs_path=$(cd "$(dirname "$path")" 2>/dev/null && pwd)/$(basename "$path") || echo "$path"
    local abs_source=$(cd "$SOURCE_DIR" 2>/dev/null && pwd) || echo "$SOURCE_DIR"
    local abs_output=$(cd "$OUTPUT_DIR" 2>/dev/null && pwd) || echo "$OUTPUT_DIR"
    
    # Calculate relative path from source
    local relative_path="${path#$SOURCE_DIR/}"
    if [ "$relative_path" = "$path" ]; then
        relative_path="${path#$SOURCE_DIR}"
        relative_path="${relative_path#/}"
    fi
    
    # Always exclude output directory
    if [[ "$abs_path" == "$abs_output"* ]]; then
        return 0
    fi
    
    # Check against each exclusion pattern
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        # Remove leading ./ if present
        pattern="${pattern#./}"
        
        # Exact match for relative path
        if [[ "$relative_path" == "$pattern" ]]; then
            return 0
        fi
        
        # Match for subdirectories
        if [[ "$relative_path" == "$pattern/"* ]]; then
            return 0
        fi
        
        # Match for basename (filename matching)
        local basename=$(basename "$path")
        if [[ "$basename" == "$pattern" ]]; then
            return 0
        fi
        
        # Glob pattern matching
        if [[ "$relative_path" == $pattern ]]; then
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
        # Skip comment-only lines
        if [[ "$line" =~ ^[[:space:]]*# ]]; then
            continue
        fi
        
        # Skip empty lines
        if [[ -z "$(echo "$line" | tr -d '[:space:]')" ]]; then
            continue
        fi
        
        # Remove inline comments (but preserve # in JSON-like structures)
        if [[ "$line" != *'['* ]] && [[ "$line" == *"#"* ]]; then
            line="${line%%#*}"
            line=$(echo "$line" | sed 's/[[:space:]]*$//')
        fi
        
        # Remove leading indentation if requested
        if [[ "$REMOVE_INDENT" == "true" ]]; then
            line=$(echo "$line" | sed 's/^[[:space:]]*//')
        fi
        
        # Only write non-empty lines
        if [[ -n "$(echo "$line" | tr -d '[:space:]')" ]]; then
            echo "$line" >> "$temp_file"
        fi
    done < "$input_file"
    
    mv "$temp_file" "$output_file"
}

process_directory() {
    local src_dir="$1"
    local dest_dir="$2"
    
    # Create destination directory
    mkdir -p "$dest_dir"
    
    # Process each entry in source directory
    for entry in "$src_dir"/*; do
        # Skip if entry doesn't exist (empty directory)
        if [ ! -e "$entry" ]; then
            continue
        fi
        
        # Check if entry should be excluded
        if is_excluded "$entry"; then
            echo -e "${YELLOW}Skipped (excluded):${NC} ${entry#$SOURCE_DIR/}"
            continue
        fi
        
        local basename=$(basename "$entry")
        local dest_path="$dest_dir/$basename"
        
        if [ -d "$entry" ]; then
            # Recursively process subdirectory
            process_directory "$entry" "$dest_path"
        elif [ -f "$entry" ]; then
            # Process file
            if [[ "$basename" == *.mcfunction ]]; then
                optimize_mcfunction "$entry" "$dest_path"
                echo -e "${GREEN}Optimized:${NC} ${entry#$SOURCE_DIR/}"
            else
                cp "$entry" "$dest_path"
                echo -e "${BLUE}Copied:${NC} ${entry#$SOURCE_DIR/}"
            fi
        fi
    done
}

find_datapacks() {
    local search_dir="$1"
    local -n result_array=$2
    
    # Look for directories with pack.mcmeta
    for entry in "$search_dir"/*; do
        if [ -d "$entry" ] && [ -f "$entry/pack.mcmeta" ]; then
            if ! is_excluded "$entry"; then
                result_array+=("$entry")
                echo -e "${GREEN}Found datapack:${NC} $(basename "$entry")"
            fi
        fi
    done
}

process_single_datapack() {
    local datapack_dir="$1"
    local temp_datapack_dir="$2"
    local datapack_name="$3"
    local output_path="$4"
    
    echo -e "\n${BLUE}━━━ Processing datapack: ${datapack_name} ━━━${NC}"
    process_directory "$datapack_dir" "$temp_datapack_dir"
    
    # Verify that files were actually copied
    local file_count=$(find "$temp_datapack_dir" -type f | wc -l)
    echo -e "${BLUE}Total files processed: ${file_count}${NC}"
    
    if [ $file_count -eq 0 ]; then
        echo -e "${RED}Warning: No files found in processed datapack!${NC}"
        return 1
    fi
    
    echo -e "${BLUE}Creating zip for ${datapack_name}...${NC}"
    cd "$temp_datapack_dir"
    zip -r -9 "$output_path" . > /dev/null 2>&1
    local zip_result=$?
    cd - > /dev/null
    
    if [ $zip_result -ne 0 ]; then
        echo -e "${RED}Error: Failed to create zip archive${NC}"
        return 1
    fi
    
    local size=$(du -h "$output_path" | cut -f1)
    echo -e "${GREEN}✓ Created: ${output_path} (${size})${NC}"
}

main() {
    echo -e "${BLUE}Configuration:${NC}"
    echo -e "  Source: ${SOURCE_DIR}"
    echo -e "  Output: ${OUTPUT_DIR}"
    echo -e "  Archive name: ${OUTPUT_NAME}"
    echo -e "  Remove indent: ${REMOVE_INDENT}"
    echo -e "  Exclude file: ${EXCLUDE_FILE}"
    echo ""
    
    # Verify source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo -e "${RED}Error: Source directory not found: $SOURCE_DIR${NC}"
        exit 1
    fi
    
    # Clean up old temp directory
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
    
    # Create output directories
    mkdir -p "$OUTPUT_DIR"
    local datapacks_output_dir="$OUTPUT_DIR/datapacks"
    mkdir -p "$datapacks_output_dir"
    
    # Find all datapacks
    declare -a datapacks=()
    echo -e "${BLUE}Searching for datapacks...${NC}"
    find_datapacks "$SOURCE_DIR" datapacks
    
    if [ ${#datapacks[@]} -eq 0 ]; then
        # Single datapack at root
        if [ -f "$SOURCE_DIR/pack.mcmeta" ]; then
            echo -e "${BLUE}Single datapack detected at root${NC}\n"
            
            local output_path="$datapacks_output_dir/$OUTPUT_NAME"
            if [ -f "$output_path" ]; then
                rm "$output_path"
            fi
            
            echo -e "${BLUE}Processing files...${NC}"
            process_directory "$SOURCE_DIR" "$TEMP_DIR"
            
            # Verify files were copied
            local file_count=$(find "$TEMP_DIR" -type f | wc -l)
            echo -e "${BLUE}Total files processed: ${file_count}${NC}"
            
            if [ $file_count -eq 0 ]; then
                echo -e "${RED}Error: No files were processed! Check your exclusion patterns.${NC}"
                rm -rf "$TEMP_DIR"
                exit 1
            fi
            
            echo -e "\n${BLUE}Creating zip archive...${NC}"
            cd "$TEMP_DIR"
            zip -r -9 "$output_path" . > /dev/null 2>&1
            local zip_result=$?
            cd - > /dev/null
            
            if [ $zip_result -ne 0 ]; then
                echo -e "${RED}Error: Failed to create zip archive${NC}"
                rm -rf "$TEMP_DIR"
                exit 1
            fi
            
            rm -rf "$TEMP_DIR"
            
            local size=$(du -h "$output_path" | cut -f1)
            echo -e "\n${GREEN}✓ Zip created:${NC} $output_path"
            echo -e "${GREEN}✓ Total size:${NC} $size"
        else
            echo -e "${RED}Error: No datapacks found (no pack.mcmeta in root or subdirectories)${NC}"
            echo -e "${YELLOW}Tip: Make sure pack.mcmeta exists in your datapack directory${NC}"
            exit 1
        fi
    else
        # Multiple datapacks
        echo -e "${BLUE}Multiple datapacks detected: ${#datapacks[@]}${NC}\n"
        
        local success_count=0
        for datapack_path in "${datapacks[@]}"; do
            local datapack_name=$(basename "$datapack_path")
            local temp_datapack_dir="$TEMP_DIR/$datapack_name"
            local output_zip="$datapacks_output_dir/${datapack_name}.zip"
            
            if process_single_datapack "$datapack_path" "$temp_datapack_dir" "$datapack_name" "$output_zip"; then
                ((success_count++))
            fi
        done
        
        rm -rf "$TEMP_DIR"
        
        echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${GREEN}✓ Successfully created ${success_count}/${#datapacks[@]} datapacks${NC}"
        echo -e "${GREEN}Output directory:${NC} $datapacks_output_dir"
        
        for datapack_path in "${datapacks[@]}"; do
            local datapack_name=$(basename "$datapack_path")
            local output_file="$datapacks_output_dir/${datapack_name}.zip"
            if [ -f "$output_file" ]; then
                local size=$(du -h "$output_file" | cut -f1)
                echo -e "  ${GREEN}✓${NC} ${datapack_name}.zip (${size})"
            fi
        done
    fi
    
    echo -e "\n${GREEN}✓ Optimization complete!${NC}"
}

main