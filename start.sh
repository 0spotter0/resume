#!/bin/bash

# Exit on error
set -e

VENV_DIR=".venv"
REQUIREMENTS_FILE="requirements.txt"

# Check if virtual environment exists, if not create it
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment in $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
    echo "Virtual environment created."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"
echo "Virtual environment activated."

# Install dependencies from requirements.txt
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing dependencies from $REQUIREMENTS_FILE..."
    pip install -r "$REQUIREMENTS_FILE"
    echo "Dependencies installed."
else
    echo "Warning: $REQUIREMENTS_FILE not found. Skipping dependency installation."
fi

echo "Starting watcher..."
python watcher.py "typst compile resume.typ" data.yaml resume.typ sections.typ templates.typ
