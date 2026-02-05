import pytest
import os
import sys
from agent.conductor.cli import main

def test_cli_help(capsys):
    """Test that the CLI entry point responds to --help."""
    with pytest.raises(SystemExit) as excinfo:
        sys.argv = ["cli.py", "--help"]
        main()
    assert excinfo.value.code == 0
    captured = capsys.readouterr()
    assert "usage:" in captured.out.lower()

def test_cli_invalid_command(capsys):
    """Test that the CLI handles invalid commands gracefully."""
    with pytest.raises(SystemExit) as excinfo:
        sys.argv = ["cli.py", "nonexistent"]
        main()
    assert excinfo.value.code != 0
    captured = capsys.readouterr()
    assert "error" in captured.err.lower()

def test_cli_no_command(capsys):
    """Test that the CLI shows help and exits when no command is provided."""
    with pytest.raises(SystemExit) as excinfo:
        sys.argv = ["cli.py"]
        main()
    assert excinfo.value.code == 1
    captured = capsys.readouterr()
    assert "usage:" in captured.out.lower()
