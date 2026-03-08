# FASTA Sequence Extractor
## Description

This project includes a Bash script, `extract_seqs.sh`, that extracts specific sequences from a FASTA file based on a list of target sequence names.  

The script prints matching sequences to stdout and provides a summary (requested, found, not found) to stderr. It handles errors if files are missing or arguments are not provided.

## Usage

Run the script with two arguments:

```bash
./extract_seqs.sh <fasta_file> <names_file>
<fasta_file> : Path to a FASTA file containing sequences
<names_file> : Path to a text file with one sequence name per line

---

### **Step 4: Example**

```markdown
## Example

Given `data/all_genes.fa`:
BRCA1 DNA repair
ATGGATCCAAAG
TP53 tumor suppressor
ATGGAGGAGCCG
EGFR growth factor
ATGCGACCCTCC
KRAS proto-oncogene
ATGACTGAATAT

And `data/targets.txt`:
TP53
KRAS

Run:

```bash
./extract_seqs.sh data/all_genes.fa data/targets.txt

Expected stdout: 
>TP53 tumor suppressor
ATGGAGGAGCCG
>KRAS proto-oncogene
ATGACTGAATAT

Expected stderr:
Requested: 2
Found: 2
Not found: 0

---

### **Step 5: Error handling**

```markdown
## Error Handling

- If the script is run with missing arguments:

```bash
./extract_seqs.sh

Output:
Usage: ./extract_seqs.sh <fasta_file> <names_file>

If either file does not exist:
./extract_seqs.sh missing.fa missing.txt

Output:
Error: FASTA file not found

or

Error: names file not found

---

### **Step 6: Dependencies**

```markdown
## Dependencies

- Bash (tested with Bash 5.1+)  
- awk (standard Unix text-processing tool)

## Test Script

`test.sh` includes 4 test cases:

1. All names found  
2. Some names missing  
3. No names found  
4. Missing arguments  

Run:

```bash
./test.sh

---

### **Step 8: Repository structure (optional, but good)**

```markdown
## Repository Structure

e175-project/
├── extract_seqs.sh # Main script
├── test.sh # Test script
├── README.md # Documentation
├── assignment_08.txt # Assignment instructions
└── data/ # Input data (FASTA and targets)

