# Virtual environment setup
venv:
    python -m venv venv
    @echo "Virtual environment created. Activate with: .\venv\Scripts\Activate.ps1 (PowerShell) or venv\Scripts\activate.bat (CMD)"

# Install dependencies
install:
    pip install -r requirements.txt

# Setup project (create venv and install dependencies)
setup: venv
    @echo "Installing dependencies..."
    .\venv\Scripts\python.exe -m pip install -r requirements.txt
    @echo "Setup complete! Activate with: .\venv\Scripts\Activate.ps1"

# Run the trading script
trade:
    python "Experiments/chatgpt_micro-cap/scripts/processing/trading_script.py" --data-dir "Experiments/chatgpt_micro-cap/csv_files" $(ARGS)

# Generate graphs
graph:
    python "Start Your Own/Generate_Graph.py" $(ARGS)

# Clean up virtual environment
clean:
    if exist venv rmdir /s /q venv
    @echo "Virtual environment removed"

.PHONY: venv install setup trade graph clean

