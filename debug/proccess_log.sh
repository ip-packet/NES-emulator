#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input output"
    exit 1
fi

input_file="$1"
output_file="$2"

awk '{
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^A:/ || $i ~ /^X:/ || $i ~ /^Y:/ || $i ~ /^P:/ || $i ~ /^SP:/) {
            printf "%s ", $i
        }
    }
       printf "\n"
}' "$input_file" > "$output_file"

echo "to $output_file"

