#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

# First argument is the input directory
input_dir=$1

# Second argument is the output directory
output_dir=$2

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each mp4 file in the input directory
for input_file in "$input_dir"/*.mp4; do
    # Extract the filename without the extension
    filename=$(basename "$input_file" .mp4)

    # Construct the output filename
    output_file="$output_dir"/"$filename".wav

    # Run ffmpeg to convert the file
    ffmpeg -i "$input_file" -ar 16000 "$output_file"
done