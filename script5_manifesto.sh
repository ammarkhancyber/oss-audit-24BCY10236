#!/bin/bash
# ============================================================
# Script 5: The Open Source Manifesto Generator
# Author  : Ammar Khan
# Roll No : 24BCY10236
# Course  : Open Source Software (OSS)
# Audit   : Git
# ============================================================
# Concepts: read -p for interactive input, file redirection
#           >> and >, date formatting, string concatenation,
#           here-documents, functions
# ============================================================

OUTPUT_FILE="manifesto_AmmarKhan_24BCY10236.txt"
DATE_NOW=$(date '+%d %B %Y, %H:%M:%S')

# Clear any previous manifesto file
> "$OUTPUT_FILE"

echo "======================================================"
echo "    OPEN SOURCE AUDIT — MANIFESTO GENERATOR           "
echo "======================================================"
echo "  Student : Ammar Khan | Roll: 24BCY10236"
echo "  This script will create your personal Open Source"
echo "  Manifesto. Please answer the prompts below."
echo "======================================================"
echo ""

# --- Interactive prompts ---
read -p "  1. What does 'open source' mean to you in one sentence?
  >> " MEANING

read -p "
  2. Name one open-source project that has impacted your life and why:
  >> " IMPACT

read -p "
  3. What freedom is most important to you in open-source software?
     (e.g., freedom to study, modify, share, use)
  >> " FREEDOM

read -p "
  4. How do you plan to contribute to open source in the future?
  >> " CONTRIBUTION

read -p "
  5. Write a one-line open-source pledge or motto for yourself:
  >> " PLEDGE

echo ""
echo "  Generating your manifesto..."
sleep 1

# --- Write manifesto to file ---
cat > "$OUTPUT_FILE" << EOF
======================================================
         MY OPEN SOURCE MANIFESTO
======================================================
  Author    : Ammar Khan
  Roll No   : 24BCY10236
  Course    : Open Source Software (OSS)
  Audit SW  : Git
  Generated : $DATE_NOW
======================================================

WHAT OPEN SOURCE MEANS TO ME:
  $MEANING

THE PROJECT THAT IMPACTED ME:
  $IMPACT

THE FREEDOM I VALUE MOST:
  $FREEDOM

MY CONTRIBUTION PLAN:
  $CONTRIBUTION

MY OPEN SOURCE PLEDGE:
  "$PLEDGE"

======================================================
  "Given enough eyeballs, all bugs are shallow."
                              — Linus's Law (Eric S. Raymond)
======================================================
EOF

# --- Display the manifesto ---
echo ""
echo "======================================================"
echo "  YOUR MANIFESTO HAS BEEN SAVED TO: $OUTPUT_FILE"
echo "======================================================"
echo ""
cat "$OUTPUT_FILE"
echo ""
echo "======================================================"
echo "  Thank you, Ammar Khan. Your manifesto is complete!"
echo "======================================================"
