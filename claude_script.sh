#!/bin/bash

# Check if Python is installed
if ! command -v python &> /dev/null; then
    echo "Python is not installed. Please install Python to proceed."
    exit 1
fi

# Check if the 'venv' module is available (Python 3+)
if ! python -c 'import venv' &> /dev/null; then
    echo "Python 'venv' module is not available. Please ensure Python 3+ is installed."
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Activate virtual environment
echo "Activating virtual environment..."
source "$SCRIPT_DIR/venv/bin/activate" || { echo "Failed to activate virtual environment."; exit 1; }

# Check if the virtual environment is activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Virtual environment is not activated. Please check your setup."
    exit 1
fi

# Install anthropic package if not installed
if ! python -c 'import anthropic' &> /dev/null; then
    echo "anthropic package not found. Installing..."
    pip install anthropic || { echo "Failed to install anthropic package."; exit 1; }
fi

# Run the Python script with arguments
python "$SCRIPT_DIR/claude.py" "$@"

# Deactivate virtual environment
deactivate