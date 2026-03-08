#!/bin/bash

# check two arguments provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <fasta_file> <names_file>" >&2
  exit 1
fi

# Store arguments in variables
FASTA=$1
NAMES=$2

# Check that FASTA file exists
if [ ! -f "$FASTA" ]; then
  echo "Error: FASTA file not found" >&2
  exit 1
fi

if [ ! -f "$NAMES" ]; then
  echo "Error: names file not found" >&2
  exit 1
fi

# Count how many names were requested
requested=$(wc -l < "$NAMES")

# Prepare counters
found=0
not_found=0

# Loop through each target name
while read name; do
  if grep -q "^>$name" "$FASTA"; then
    awk -v target="$name" '
    BEGIN {print_seq=0}
    /^>/ {
        if ($1 == ">"target) {
            print_seq=1
            print
            next
        } else if (print_seq==1) {
            exit
        }
    }
    print_seq {print}
    ' "$FASTA"
    ((found++))
  else
    echo "$name" >&2
    ((not_found++))
  fi
done < "$NAMES"

# Print the summary to stderr
echo "Requested: $requested" >&2
echo "Found: $found" >&2
echo "Not found: $not_found" >&2
