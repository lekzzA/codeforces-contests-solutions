#!/bin/bash

# Loop through each C++ file in src directory
for file in src/*.cpp; do
  # Get the base name, e.g., "solution1" from "solution1.cpp"
  base_name=$(basename "$file" .cpp)

  # Define paths for the test case and expected output files
  test_cases_file="tests/${base_name}_test_cases.txt"
  expected_output_file="tests/${base_name}_expected_output.txt"
  output_file="tests/${base_name}_output.txt"

  # Check if both test cases and expected output files exist
  if [[ -f "$test_cases_file" && -f "$expected_output_file" ]]; then
    # Compile the C++ file
    g++ -o "tests/${base_name}" "$file"

    # Run the compiled program with the test cases and capture the output
    "tests/${base_name}" < "$test_cases_file" > "$output_file"

    # Compare the output with the expected output
    if diff "$output_file" "$expected_output_file"; then
      echo "Test passed for $file"
    else
      echo "Test failed for $file"
      exit 1
    fi
  else
    echo "Test cases or expected output file missing for $file"
    exit 1
  fi
done
