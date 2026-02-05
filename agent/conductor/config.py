import json
import os

def load_setup_state():
    """Load the project setup state from conductor/setup_state.json."""
    path = os.path.join("conductor", "setup_state.json")
    if not os.path.exists(path):
        return None
    try:
        with open(path, "r") as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError):
        return None

def load_track_metadata(track_id):
    """Load metadata for a specific track from its directory."""
    path = os.path.join("conductor", "tracks", track_id, "metadata.json")
    if not os.path.exists(path):
        return None
    try:
        with open(path, "r") as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError):
        return None
