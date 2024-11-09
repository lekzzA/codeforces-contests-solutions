#!/bin/bash

# Loop through each C++ file in the src directory within contest folders
for file in src/*/*.cpp; do
  pwd
  ls -lart
  # Get the contest and solution names, e.g., "contest1/solution1"
  contest_name=$(basename "$(dirname "$file")")
  solution_name=$(basename "$file" .cpp)

  echo "Processing C++ file: $file"
  echo "Contest: $contest_name, Solution: $solution_name"

  # Define paths for the test case and expected output files
  test_cases_file="tests/${contest_name}/${solution_name}_test_cases.txt"
  expected_output_file="tests/${contest_name}/${solution_name}_expected_output.txt"
  output_file="tests/${contest_name}/${solution_name}_output.txt"

  echo "Test cases file: $test_cases_file"
  echo "Expected output file: $expected_output_file"

  # Check if both test cases and expected output files exist
  if [[ -f "$test_cases_file" && -f "$expected_output_file" ]]; then
    echo "Test cases and expected output files found."

    # Compile the C++ file
    echo "Compiling $file..."
    g++ -o "tests/${contest_name}/${solution_name}" "$file"

    if [[ $? -ne 0 ]]; then
      echo "Compilation failed for $file"
      exit 1
    fi

    echo "Running the compiled program with test cases..."
    # Run the compiled program with the test cases and capture the output
    "tests/${contest_name}/${solution_name}" < "$test_cases_file" > "$output_file"

    echo "Comparing the output with the expected output..."
    # Compare the output with the expected output
    if diff "$output_file" "$expected_output_file"; then
      echo "Test passed for $file"
    else
      echo "Test failed for $file"
      exit 1
    fi
  else
    echo "Error: Test cases or expected output file missing for $file"
    echo "Test case file: $test_cases_file"
    echo "Expected output file: $expected_output_file"
    exit 1
  fi
done
