#!/bin/bash

# Define virtual environment directory
VENV_DIR="venv"

# Check if virtual environment exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv $VENV_DIR
fi

# Check if requirements.txt exists and install dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    $VENV_DIR/bin/pip install -r requirements.txt
else
    echo "requirements.txt not found"
fi

# Activate virtual environment if script is sourced
if [ "$0" != "$BASH_SOURCE" ]; then
    echo "Activating virtual environment..."
    source $VENV_DIR/bin/activate
else
    echo "Setup complete"
    echo "To activate the virtual environment, run:"
    echo "source $VENV_DIR/bin/activate"
fi