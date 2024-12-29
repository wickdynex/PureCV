#!/bin/bash

# Define the directory to be watched (current directory, which is "zh")
WATCH_DIR="."

# Define the file pattern to watch for (all .tex files)
FILE_PATTERN="*.tex"

# Define the delay in seconds (wait time for fswatch)
WATCH_DELAY=2

# Change to the directory where the script is located (i.e., "zh" folder)
cd "$WATCH_DIR" || exit

# Use fswatch to monitor the directory for changes (recursively) and output file paths
# -l means later for ${WATCH_DELAY} seconds
fswatch -r -l "$WATCH_DELAY" . | while read -r event
do
    # Get the absolute path of the event to ensure it's standardized
    event_abs=$(realpath "$event")

    # Check if the changed file is a .tex file by iterating over all .tex files
    for file in $(find . -name "$FILE_PATTERN"); do
        # Get the absolute path of each file to compare with fswatch output
        file_abs=$(realpath "$file")

        # Compare the absolute paths to avoid relative path issues
        if [[ "$event_abs" == "$file_abs" ]]; then
            # Ignore make command output
            echo "[INFO] Generate"
            make clean &>/dev/null || true
            make &>/dev/null
            echo "[INFO] Finish"
        fi
    done
done
