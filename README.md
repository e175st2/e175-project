# FASTA Sequence Extractor
## Description

This project contains a Bash script called `extract_seqs.sh` that extracts specific sequences from a FASTA file, given names of the desired sequences.  

It outputs the matching sequences to stdout and provides a summary (requested, found, not found) to stderr. It handles errors if files are missing or arguments are not provided.

## Usage

Run the script with two arguments:

```bash
./extract_seqs.sh <fasta_file> <names_file>
```

- `<fasta_file>` : Path to a FASTA file containing sequences
- `<names_file>` : Path to a text file with one sequence name per line

---

## Example

Given `data/all_genes.fa`:

```
>BRCA1 DNA repair
ATGGATCCAAAG
>TP53 tumor suppressor
ATGGAGGAGCCG
>EGFR growth factor
ATGCGACCCTCC
>KRAS proto-oncogene
ATGACTGAATAT
```

And `data/targets.txt`:

```
TP53
KRAS
```

Run:

```bash
./extract_seqs.sh data/all_genes.fa data/targets.txt
```

Expected stdout: 

```
>TP53 tumor suppressor
ATGGAGGAGCCG
>KRAS proto-oncogene
ATGACTGAATAT
```

Expected stderr:

```
Requested: 2
Found: 2
Not found: 0
```

---

## Error Handling

If the script is run with missing arguments:

```bash
./extract_seqs.sh
```

Output:

```
Usage: ./extract_seqs.sh <fasta_file> <names_file>
```

If either file does not exist:

```bash
./extract_seqs.sh missing.fa missing.txt
```

Output:

```
Error: FASTA file not found
```

or

```
Error: names file not found
```

---

## Dependencies

- Bash (tested with Bash 5.1+)  
- awk (standard Unix text-processing tool)

## Test Script

`test.sh` includes 4 test cases:

1. All names found  
2. Some names missing  
3. No names found  
4. Missing arguments  

Run the test script with:

```bash
./test.sh
```

---

## Repository Structure

```
e175-project/
├── extract_seqs.sh       # Main script
├── test.sh               # Test script
├── README.md             # Documentation 
├── assignment_08.txt     # Assignment instructions
└── data/                 # Input data (FASTA and targets)
    ├── all_genes.fa
    └── targets.txt
```

---

## Academic Integrity
I used chat gpt to help guide myself in creating this project. This AI platform assisted me in writing my codes. However, it also helped me break everything down step by step to understand all code. I wrote all the commands in my ipad with a description to fully understand what exactly everything means. It also helped me figure out how to organize the `README.md` file so that it is easy to follow along on GitHub.
