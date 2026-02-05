import json
import os
import pytest
from agent.conductor.config import load_setup_state, load_track_metadata

def test_load_setup_state(tmp_path):
    """Test loading setup_state.json."""
    conductor_dir = tmp_path / "conductor"
    conductor_dir.mkdir()
    state_file = conductor_dir / "setup_state.json"
    state_data = {"last_successful_step": "2.5_workflow"}
    state_file.write_text(json.dumps(state_data))
    
    # Mock current directory to use tmp_path
    os.chdir(tmp_path)
    
    state = load_setup_state()
    assert state == state_data

def test_load_setup_state_missing(tmp_path):
    """Test loading setup_state.json when it's missing."""
    os.chdir(tmp_path)
    state = load_setup_state()
    assert state is None

def test_load_track_metadata(tmp_path):
    """Test loading metadata.json for a specific track."""
    tracks_dir = tmp_path / "conductor" / "tracks"
    tracks_dir.mkdir(parents=True)
    track_dir = tracks_dir / "test_track"
    track_dir.mkdir()
    metadata_file = track_dir / "metadata.json"
    metadata_data = {"track_id": "test_track", "status": "new"}
    metadata_file.write_text(json.dumps(metadata_data))
    
    os.chdir(tmp_path)
    metadata = load_track_metadata("test_track")
    assert metadata == metadata_data

def test_load_track_metadata_missing(tmp_path):
    """Test loading metadata.json when it's missing."""
    os.chdir(tmp_path)
    metadata = load_track_metadata("nonexistent")
    assert metadata is None

def test_load_setup_state_malformed(tmp_path):
    """Test loading malformed setup_state.json."""
    conductor_dir = tmp_path / "conductor"
    conductor_dir.mkdir()
    state_file = conductor_dir / "setup_state.json"
    state_file.write_text("not json")
    
    os.chdir(tmp_path)
    state = load_setup_state()
    assert state is None

def test_load_track_metadata_malformed(tmp_path):
    """Test loading malformed metadata.json."""
    tracks_dir = tmp_path / "conductor" / "tracks"
    tracks_dir.mkdir(parents=True)
    track_dir = tracks_dir / "test_track"
    track_dir.mkdir()
    metadata_file = track_dir / "metadata.json"
    metadata_file.write_text("not json")
    
    os.chdir(tmp_path)
    metadata = load_track_metadata("test_track")
    assert metadata is None
