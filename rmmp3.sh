#!/bin/bash

python shohan.py

# Function to check if a file has the .mp4 extension
has_mp4_extension() {
  local filename="$1"
  [[ "${filename##*.}" == "mp4" ]]
}

# Get the directory path from the user (or use the current directory)
read -p "Enter the directory path (or press Enter to use current directory): " dir_path

# If no path is provided, use the current directory
if [[ -z "$dir_path" ]]; then
  dir_path="."
fi

# Check if the directory exists
if [[ ! -d "$dir_path" ]]; then
  echo "Error: Directory '$dir_path' does not exist."
  exit 1
fi

# Loop through all files in the directory
for file in "$dir_path/"*; do
  # Skip directories and hidden files
  if [[ -d "$file" || "$file" == "." || "$file" == ".." ]]; then
    continue
  fi

  # Check if the file has the .mp4 extension
  if has_mp4_extension "$file"; then
    new_filename="${file%.*}.mp3"  # Remove the old extension with parameter expansion
    mv "$file" "$dir_path/$new_filename"
    echo "Renamed '$file' to '$new_filename'"
  fi
done

echo "Finished processing files in '$dir_path'."
