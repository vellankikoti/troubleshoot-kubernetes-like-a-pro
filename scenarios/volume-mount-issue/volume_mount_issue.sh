#!/bin/bash
# Simulate a volume mount issue by attempting to write to a non-existent directory
echo "Attempting to write to a non-existent directory to simulate mount issue"
echo "Hello World" > /non_existent_directory/test_file.txt
