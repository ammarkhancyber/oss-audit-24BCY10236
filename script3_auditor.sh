#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author  : Ammar Khan
# Roll No : 24BCY10236
# Course  : Open Source Software (OSS)
# Audit   : Git
# ============================================================
# Concepts: arrays, for loops, conditional [ -d ] checks,
#           du -sh, stat, awk, printf formatting
# ============================================================

# Array of directories to audit (includes Git-related paths)
DIRS=(
    "/etc"
    "/usr/bin"
    "/var/log"
    "/tmp"
    "/home"
    "$HOME/.git"
    "$HOME/.config/git"
    "/usr/share/git-core"
)

echo "======================================================"
echo "      OPEN SOURCE AUDIT — DISK & PERMISSION AUDIT     "
echo "======================================================"
echo "  Student : Ammar Khan | Roll: 24BCY10236"
echo "  Auditing directories for size and permissions..."
echo "======================================================"
printf "\n"
printf "  %-30s %-10s %-12s\n" "DIRECTORY" "SIZE" "PERMISSIONS"
printf "  %-30s %-10s %-12s\n" "------------------------------" "----------" "------------"

FOUND=0
NOT_FOUND=0

for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        # Get disk usage
        SIZE=$(du -sh "$dir" 2>/dev/null | awk '{print $1}')
        # Get permission string (e.g., drwxr-xr-x)
        PERMS=$(stat -c "%A" "$dir" 2>/dev/null)
        printf "  %-30s %-10s %-12s\n" "$dir" "${SIZE:-N/A}" "${PERMS:-N/A}"
        FOUND=$((FOUND + 1))
    else
        printf "  %-30s %-10s %-12s\n" "$dir" "[NOT FOUND]" "---"
        NOT_FOUND=$((NOT_FOUND + 1))
    fi
done

printf "\n"
echo "======================================================"
echo "  Summary: $FOUND directories audited, $NOT_FOUND not found."
echo "  Note: Git stores user config in ~/.config/git or ~/.gitconfig"
echo "        and global data in /usr/share/git-core."
echo "======================================================"
