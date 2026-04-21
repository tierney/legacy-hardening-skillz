#!/usr/bin/env bash
# check_dist.sh: Verify that critical files are included in the distribution tarball.

set -euo pipefail

if [ ! -f "Makefile" ]; then
    echo "Error: Run ./configure first."
    exit 1
fi

echo "Building distribution tarball..."
make dist > /dev/null

TARBALL=$(ls *.tar.gz | head -n 1)
echo "Checking $TARBALL..."

CRITICAL_FILES=("README.md" "STATUS.md" "tests/reverse-matrix.sh" "tests/reverse-cases.tsv")

for FILE in "${CRITICAL_FILES[@]}"; do
    if tar -tzf "$TARBALL" | grep -q "$FILE"; then
        echo "[PASS] $FILE found"
    else
        echo "[FAIL] $FILE missing!"
        exit 1
    fi
done

echo "Distribution integrity verified."
rm "$TARBALL"
