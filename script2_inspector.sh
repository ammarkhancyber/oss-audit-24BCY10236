#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author  : Ammar Khan
# Roll No : 24BCY10236
# Course  : Open Source Software (OSS)
# Audit   : Git
# ============================================================
# Concepts: if-then-else, case statements, dpkg -s,
#           grep, pipelines |, functions
# ============================================================

# List of FOSS packages to inspect
PACKAGES=("git" "curl" "vim" "gcc" "make")

# Function to print a philosophical note about each package
print_philosophy() {
    local pkg=$1
    case $pkg in
        git)
            echo "  >> Git: The backbone of collaborative open-source development."
            echo "     Created by Linus Torvalds in 2005, Git is itself open-source"
            echo "     (GPL v2), embodying the freedom it helps others build upon."
            ;;
        curl)
            echo "  >> curl: A silent workhorse of the internet. Open-source (MIT/curl),"
            echo "     it powers data transfer in billions of devices worldwide."
            ;;
        vim)
            echo "  >> Vim: A text editor born from open-source roots (Vi IMproved)."
            echo "     Licensed under the GPL, it has served developers for decades."
            ;;
        gcc)
            echo "  >> GCC (GNU Compiler Collection): GPL-licensed, it is the compiler"
            echo "     that built much of the open-source world, including Linux itself."
            ;;
        make)
            echo "  >> make: A fundamental build automation tool under the GPL."
            echo "     It orchestrates compilation steps, underpinning countless OSS builds."
            ;;
        *)
            echo "  >> $pkg: An open-source package contributing to the free software ecosystem."
            ;;
    esac
}

echo "======================================================"
echo "         OPEN SOURCE AUDIT — PACKAGE INSPECTOR        "
echo "======================================================"
echo "  Student : Ammar Khan | Roll: 24BCY10236"
echo "======================================================"
echo ""

# Check if dpkg is available (Debian/Ubuntu)
if ! command -v dpkg &>/dev/null; then
    echo "  [WARNING] dpkg not found. This script is designed for Debian/Ubuntu."
    echo "  On Red Hat/Fedora systems, replace 'dpkg -s' with 'rpm -q'."
    echo ""
fi

for pkg in "${PACKAGES[@]}"; do
    echo "------------------------------------------------------"
    echo "  Checking package: $pkg"

    if dpkg -s "$pkg" &>/dev/null 2>&1; then
        VERSION=$(dpkg -s "$pkg" 2>/dev/null | grep '^Version' | awk '{print $2}')
        echo "  [INSTALLED]  Version: $VERSION"
        print_philosophy "$pkg"
    else
        echo "  [NOT FOUND]  $pkg does not appear to be installed."
    fi
    echo ""
done

echo "======================================================"
echo "  Inspection complete. All packages checked."
echo "======================================================"
