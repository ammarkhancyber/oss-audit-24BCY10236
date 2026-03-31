#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author  : Ammar Khan
# Roll No : 24BCY10236
# Course  : Open Source Software (OSS)
# Audit   : Git
# ============================================================
# Concepts: variables, command substitution $(), echo,
#           uname, whoami, uptime, date, if-else, sourcing files
# ============================================================

# --- Variables ---
STUDENT_NAME="Ammar Khan"
ROLL_NUMBER="24BCY10236"
SOFTWARE_CHOICE="Git"

# --- Gather System Information ---
KERNEL=$(uname -r)
ARCH=$(uname -m)
USER_NAME=$(whoami)
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Safely detect OS distribution name
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO_NAME="$PRETTY_NAME"
else
    DISTRO_NAME="Unknown Linux Distribution"
fi

# Detect Git version if installed
if command -v git &>/dev/null; then
    GIT_VERSION=$(git --version)
else
    GIT_VERSION="Git is not installed on this system."
fi

# --- Display Banner ---
echo "======================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY         "
echo "======================================================"
echo "  Student   : $STUDENT_NAME"
echo "  Roll No   : $ROLL_NUMBER"
echo "  Auditing  : $SOFTWARE_CHOICE"
echo "------------------------------------------------------"
echo "  OS        : $DISTRO_NAME"
echo "  Kernel    : $KERNEL"
echo "  Arch      : $ARCH"
echo "  Hostname  : $HOSTNAME"
echo "  User      : $USER_NAME"
echo "  Uptime    : $UPTIME"
echo "  Date/Time : $DATE_TIME"
echo "------------------------------------------------------"
echo "  Audit SW  : $GIT_VERSION"
echo "------------------------------------------------------"
echo "  License   : The Linux kernel powering this machine  "
echo "  is licensed under the GNU GPL v2, ensuring freedom  "
echo "  to use, study, modify, and distribute the software. "
echo "======================================================"
