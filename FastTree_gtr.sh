#!/bin/bash
## script used for Tumendemberel et al. 2023 MS

# Input file
input_file="myfile.fas"

# Output tree file; it can be tre or nwk files
output_file="output.nwk"

# Run FastTree with -gtr option
FastTree -gtr -nt "$input_file" > "$output_file"
