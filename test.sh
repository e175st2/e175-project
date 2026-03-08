#!/bin/bash

# Test 1
echo "Running Test 1: All names found"

# Create a small FASTA file
echo -e ">A\nATGC\n>B\nTTAA" > test1.fa

# Create target names file (all present)
echo -e "A\nB" > names1.txt

# Run your script
output=$(./extract_seqs.sh test1.fa names1.txt 2>&1)

# Check output
if [[ $output == *">A"* && $output == *">B"* && $output == *"Requested: 2"* && $output == *"Found: 2"* && $output == *"Not found: 0"* ]]; then
    echo "Test 1 passed"
else
    echo "Test 1 failed"
fi

# Test 2
echo "Running Test 2: Some names missing"

echo -e ">A\nATGC\n>B\nTTAA" > test2.fa
echo -e "A\nC" > names2.txt

output=$(./extract_seqs.sh test2.fa names2.txt 2>&1)

if [[ $output == *">A"* && $output == *"Requested: 2"* && $output == *"Found: 1"* && $output == *"Not found: 1"* && $output == *"C"* ]]; then
    echo "Test 2 passed"
else
    echo "Test 2 failed"
fi

# Test 3
echo "Running Test 3: No names found"

echo -e ">X\nAAAA\n>Y\nCCCC" > test3.fa
echo -e "A\nB" > names3.txt

output=$(./extract_seqs.sh test3.fa names3.txt 2>&1)

if [[ $output != *">A"* && $output != *">B"* && $output == *"Requested: 2"* && $output == *"Found: 0"* && $output == *"Not found: 2"* && $output == *"A"* && $output == *"B"* ]]; then
    echo "Test 3 passed"
else
    echo "Test 3 failed"
fi

# Test 4
echo "Running Test 4: Missing arguments"
output=$(./extract_seqs.sh 2>&1)
if [[ $output == *"Usage"* ]]; then
    echo "Test 4 passed"
else
    echo "Test 4 failed"
fi
