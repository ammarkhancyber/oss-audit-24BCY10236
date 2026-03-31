Open Source Audit - Capstone Project
Student Name: Ammar Khan
Roll Number: 24BCY10236
Chosen Software: Git
Project Overview
Included Scripts

This project includes five Bash scripts that demonstrate practical Linux concepts and automation techniques.
Script 1: System Identity Report (script1_identity.sh)

Description:
This script works like a welcome screen. It collects and displays important system details such as the kernel version, current user, system uptime, and a message related to the open-source nature of the operating system.

Concepts Used:
Variables, command substitution $(), echo, uname, whoami, uptime

How to Run:

# Make the script executable
chmod +x script1_identity.sh

# Execute the script
./script1_identity.sh

Script 2: FOSS Package Inspector (script2_inspector.sh)

Description:
This script checks whether certain open-source packages (such as Git or Apache) are installed on a Debian/Ubuntu system using the dpkg command. It also uses a case statement to display a short philosophical message based on the detected software.

Concepts Used:
if-else, case, dpkg -s, grep, pipes |

How to Run:

chmod +x script2_inspector.sh
./script2_inspector.sh

Script 3: Disk and Permission Auditor (script3_auditor.sh)

Description:
This script goes through a list of important system directories (including Git-related paths) and checks their size and permission settings. It helps in understanding system storage and access control.

Concepts Used:
Arrays, loops, conditional checks [ -d ], du -sh, stat, awk

How to Run:

chmod +x script3_auditor.sh
./script3_auditor.sh

Script 4: Log File Analyzer (script4_analyzer.sh)

Description:
This script reads a log file and searches for a specific keyword (by default “error”). It counts how many times the keyword appears and displays the last few matching lines. It also handles cases where the file is missing or empty.

Concepts Used:
while read loop, command-line arguments $1, $2, counters, grep, tail

How to Run:

chmod +x script4_analyzer.sh
./script4_analyzer.sh /var/log/syslog warning

Note: You may need sudo permission to access some log files.

Script 5: Open Source Manifesto Generator (script5_manifesto.sh)

Description:
This is an interactive script that asks the user questions about open source and generates a personalized manifesto based on the responses. The output is saved to a file and also displayed on the screen.

Concepts Used:
read -p, file redirection (> and >>), date, string handling

How to Run:

chmod +x script5_manifesto.sh
./script5_manifesto.sh

