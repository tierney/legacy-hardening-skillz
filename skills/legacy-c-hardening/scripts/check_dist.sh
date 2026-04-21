#!/usr/bin/env bash
# check_dist.sh: Verify that critical files are included in the distribution tarball.
# Usage: ./check_dist.sh [config_file.json]

set -euo pipefail

CONFIG_FILE=${1:-".distcheck.json"}
DEFAULT_CRITICAL_FILES=("README.md" "LICENSE" "Makefile.am" "configure.ac")

if [ ! -f "Makefile" ]; then
    echo "Error: Run ./configure first."
    exit 1
fi

# Load critical files from config if it exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Loading critical files from $CONFIG_FILE..."
    # Simplified parsing using grep/sed to avoid dependency on jq if not present
    # Better to use jq if available, but let's keep it shell-native for portability
    CRITICAL_FILES=($(grep -o '"[^"]*"' "$CONFIG_FILE" | tr -d '"'))
else
    echo "No config found. Using default critical files list."
    CRITICAL_FILES=("${DEFAULT_CRITICAL_FILES[@]}")
fi

echo "Building distribution tarball..."
make dist > /dev/null

TARBALL=$(ls *.tar.gz | head -n 1)
echo "Checking $TARBALL..."

FAILED=0
for FILE in "${CRITICAL_FILES[@]}"; do
    if tar -tzf "$TARBALL" | grep -q "$FILE"; then
        echo "[PASS] $FILE found"
    else
        echo "[FAIL] $FILE missing!"
        FAILED=1
    fi
done

rm "$TARBALL"

if [ $FAILED -eq 1 ]; then
    echo "Distribution integrity check FAILED."
    exit 1
else
    echo "Distribution integrity verified."
    exit 0
fi
